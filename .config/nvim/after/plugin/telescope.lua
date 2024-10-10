local telescope = require('telescope')

telescope.setup {
    defaults = {
        layout_config = {
            width = 0.95,
            height = 0.95,
            preview_width = 80,
        },
        file_ignore_patterns = {
            "%.meta",
            "%.prefab",
            "%.asset",
            "%.blob",
            "%.csproj"
        },
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--ignore-file',
            '.gitignore'
        },
    },
    extensions = {
        projects = {
            on_project_selected = function()
                print("Project selected")
            end
        }
    }
}

telescope.load_extension("ui-select")
require('telescope').load_extension('projects')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>th', builtin.help_tags, {})

vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
-- Frecency is borked; fallback on the builtin file finder
--vim.keymap.set('n', '<leader>tf', function() require('telescope').extensions.frecency.frecency({ workspace = 'CWD' }) end)

vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>tm', builtin.marks, {})
vim.keymap.set('n', '<leader>te', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tr', builtin.registers, {})
vim.keymap.set('n', '<leader>tq', builtin.quickfix, {})
vim.keymap.set('n', '<leader>ts', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>tk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>tp', ":lua require'telescope'.extensions.projects.projects{}<CR>")
vim.keymap.set('n', '<leader>tc', builtin.highlights, {})
vim.keymap.set('n', '<leader>td', ":lua DirPicker()<CR>", { noremap = true, silent = true })

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local oil = require('oil')


-- Directory picker (opens in Oil)
local function jumpToDir(prompt_bufnr)
    local selected_entry = action_state.get_selected_entry()
    actions.close(prompt_bufnr)
    oil.open(selected_entry[1])
end

function DirPicker()
    require('telescope.pickers').new({}, {
        prompt_title = 'Fuzzy Search Directories',
        finder = DirFinder({}),
        previewer = require("telescope.previewers").vim_buffer_qflist.new({}),
        sorter = require('telescope.config').values.generic_sorter({}),
        attach_mappings = function(_, map)
            map('i', '<CR>', jumpToDir)
            map('n', '<CR>', jumpToDir)
            return true
        end,
    }):find()
end

function DirFinder(opts)
    opts = opts or {}

    local async = require "plenary.async"
    local async_job = require "telescope._"
    local LinesPipe = require("telescope._").LinesPipe

    local make_entry = require "telescope.make_entry"

    local await_count = 1000

    local entry_maker = opts.entry_maker or make_entry.gen_from_string(opts)
    local cwd = opts.cwd or vim.fn.getcwd()
    local env = opts.env

    local results = vim.F.if_nil(opts.results, {})
    local num_results = #results

    local job_started = false
    local job_completed = false
    local stdout = nil

    local cfg_path = vim.fn.stdpath('config')
    local search_script = cfg_path .. '/find_dirs.sh'

    local job

    return setmetatable({
        close = function()
            if job then
                job:close()
            end
        end,
        results = results,
        entry_maker = opts.entry_maker or make_entry.gen_from_string(opts),
    }, {
        __call = function(_, prompt, process_result, process_complete)
            if not job_started then

                stdout = LinesPipe()
                job = async_job.spawn {
                    command = search_script,
                    args = {},
                    cwd = cwd,
                    env = env,

                    stdout = stdout,
                }

                job_started = true
            end

            if not job_completed then
                if not vim.tbl_isempty(results) then
                    for _, v in ipairs(results) do
                        process_result(v)
                    end
                end
                for line in stdout:iter(false) do
                    num_results = num_results + 1

                    if num_results % await_count then
                        async.util.scheduler()
                    end

                    local entry = entry_maker(line)
                    if entry then
                        entry.index = num_results
                    end
                    results[num_results] = entry
                    process_result(entry)
                end

                process_complete()
                job_completed = true

                return
            end

            local current_count = num_results
            for index = 1, current_count do
                if index % await_count then
                    async.util.scheduler()
                end

                if process_result(results[index]) then
                    break
                end
            end

            if job_completed then
                process_complete()
            end
        end,
    })
end

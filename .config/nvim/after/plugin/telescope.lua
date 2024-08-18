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
        extensions = {
            ["ui-select"] = {
                require('telescope.themes').get_dropdown {

                }
            }
        }
    }
}

telescope.load_extension("ui-select")
require('telescope').load_extension('projects')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tf', builtin.find_files, {})

-- Frecency is borked; fallback on the builtin file finder
--vim.keymap.set('n', '<leader>tt', function() require('telescope').extensions.frecency.frecency({ workspace = 'CWD' }) end)
vim.keymap.set('n', '<leader>tt', builtin.find_files, {})

vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>te', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tr', builtin.registers, {})
vim.keymap.set('n', '<leader>ts', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>tp', ":lua require'telescope'.extensions.projects.projects{}<CR>")
vim.keymap.set('n', '<leader>td', ":lua FuzzySearchDirs()<CR>", { noremap = true, silent = true })

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local oil = require('oil')

local function jumpToDir(prompt_bufnr)
    local selected_entry = action_state.get_selected_entry()
    actions.close(prompt_bufnr)
    oil.open(selected_entry[1])
end

function FuzzySearchDirs()
    require('telescope.pickers').new({}, {
        prompt_title = 'Fuzzy Search Directories',
        finder = require('telescope.finders').new_oneshot_job({ 'find', '.', '-type', 'd' }),
        sorter = require('telescope.config').values.generic_sorter({}),
        attach_mappings = function(_, map)
            map('i', '<CR>', jumpToDir)
            map('n', '<CR>', jumpToDir)
            return true
        end,
    }):find()
end


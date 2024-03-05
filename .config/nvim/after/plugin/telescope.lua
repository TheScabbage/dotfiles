local telescope = require('telescope')

telescope.setup {
    defaults = {
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

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>tt', '<Cmd>Telescope frecency workspace=CWD<CR>')
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>td', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tr', builtin.registers, {})
vim.keymap.set('n', '<leader>ts', builtin.lsp_document_symbols, {})

--vim.keymap.set('n', '<leader>th', function()
--    builtin.grep_string({ search = vim.fn.input("Grep > ") });
--end)

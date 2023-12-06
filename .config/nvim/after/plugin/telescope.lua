local builtin = require('telescope.builtin')

-- vim.keymap.set('n', '<leader>tt', builtin.find_files, {})
vim.keymap.set('n', '<leader>tt', '<Cmd>Telescope frecency workspace=CWD<CR>')
-- vim.keymap.set('n', '<leader>tg', builtin.git_files, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>td', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})

vim.keymap.set('n', '<leader>th', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


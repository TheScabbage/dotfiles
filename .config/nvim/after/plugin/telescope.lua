local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tt', builtin.find_files, {})
vim.keymap.set('n', '<leader>tg', builtin.git_files, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>th', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>tf', '<Cmd>Telescope frecency workspace=CWD<CR>')

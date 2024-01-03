vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)

vim.keymap.set("n", "<leader>gpt", vim.cmd.ChatGPT)
vim.keymap.set("n", "<leader>cmp", vim.cmd.ChatGPTCompleteCode)

vim.keymap.set("n", "<leader>pl", vim.cmd.Gpush)

vim.api.nvim_set_keymap('n', '<C-h>', [[<Cmd>normal! 'H<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<C-t>', [[<Cmd>normal! 'T<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<C-n>', [[<Cmd>normal! 'N<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<C-s>', [[<Cmd>normal! 'S<CR>]], {noremap = true})

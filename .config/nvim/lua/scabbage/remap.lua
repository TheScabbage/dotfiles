vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)

vim.keymap.set("n", "<leader>gpt", vim.cmd.ChatGPT)
vim.keymap.set("n", "<leader>cmp", vim.cmd.ChatGPTCompleteCode)

vim.keymap.set("n", "<leader>pl", vim.cmd.Gpush)

vim.api.nvim_set_keymap('n', '<leader>jh', [[<Cmd>normal! 'H<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>jt', [[<Cmd>normal! 'T<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>jn', [[<Cmd>normal! 'N<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>js', [[<Cmd>normal! 'S<CR>]], {noremap = true})

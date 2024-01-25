vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fu", function() vim.cmd('set ff=unix') end)

-- GPT
vim.keymap.set("n", "<leader>gpt", vim.cmd.GpChatToggle)
vim.keymap.set("n", "<leader>gpn", vim.cmd.GpChatNew)

vim.keymap.set("n", "<leader>pl", vim.cmd.Gpush)

vim.api.nvim_set_keymap('n', '<leader>jh', [[<Cmd>normal! 'H<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>jt', [[<Cmd>normal! 'T<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>jn', [[<Cmd>normal! 'N<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>js', [[<Cmd>normal! 'S<CR>]], {noremap = true})

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>gg", vim.cmd.Git);

-- save my pinkies
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>',   { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>on', ':on<CR>', { noremap = true, silent = true })

-- squirly brace
vim.api.nvim_set_keymap('n', '<leader>sb', 'o{<CR>}<ESC>O', { noremap = true, silent = true })

-- system clipboard
vim.api.nvim_set_keymap('n', '<leader>v', '"+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', '"+y<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>c', '"+y<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>rfs", ":set guifont=FiraCode\\ Nerd\\ Font\\ Mono:h16")

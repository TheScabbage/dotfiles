vim.g.mapleader = " "

-- project files
vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)

-- convert line endings
vim.keymap.set("n", "<leader>fu", function() vim.cmd('set ff=unix') end)

-- move lines up/down
vim.keymap.set("n", "<C-Up>", "Vd<Up>P")
vim.keymap.set("n", "<C-Down>", "Vdp")
vim.keymap.set("v", "<C-Up>", "d<Up>P`[V`]")
vim.keymap.set("v", "<C-Down>", "dp`[V`]")

-- multi-line string split
vim.keymap.set("n", "<leader>ss", 'a" +<CR>"')

-- GPT
vim.keymap.set("n", "<leader>gpt", vim.cmd.GpChatToggle)
vim.keymap.set("n", "<leader>gpn", vim.cmd.GpChatNew)

vim.api.nvim_set_keymap('n', '<leader>jh', [[<Cmd>normal! 'H<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>jt', [[<Cmd>normal! 'T<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>jn', [[<Cmd>normal! 'N<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>js', [[<Cmd>normal! 'S<CR>]], { noremap = true })

-- git fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>gg", vim.cmd.Git);

vim.keymap.set("n", "<leader>pl", "<ESC>:Git pull")
vim.keymap.set("n", "<leader>psh", "<ESC>:Git push")

-- save my pinkies
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q',         { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>on', ':on<CR>',   { noremap = true, silent = true })


-- squirly brace
vim.api.nvim_set_keymap('n', '<leader>sb', 'o{<CR>}<ESC>O', { noremap = true, silent = true })

-- system clipboard
vim.api.nvim_set_keymap('n', '<leader>pc', '"+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>yc', '"+y<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>yc', '"+y<CR>', { noremap = true, silent = true })

-- reset font size
vim.keymap.set("n", "<leader>rfs", ":set guifont=FiraCode\\ Nerd\\ Font\\ Mono:h16")

-- convert spaces to tabs
vim.keymap.set("n", "<leader>tab", ":set noet<CR>:%retab!<CR>")

-- lsp stuff
vim.keymap.set("n", "<leader>lspr", ":LspRestart<CR>")
vim.keymap.set("n", "<leader>lspi", ":LspInfo<CR>")

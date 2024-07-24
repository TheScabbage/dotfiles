vim.g.mapleader = " "

-- project files
vim.keymap.set("n", "<leader>pf", ":Oil<CR>")

-- convert line endings to unix
vim.keymap.set("n", "<leader>leu", function() vim.cmd('set ff=unix') end)

-- move lines up/down
vim.keymap.set("n", "<C-Up>", 'V"ayV"_d<Up>"aP')
vim.keymap.set("n", "<C-Down>", 'V"ayV"_d"ap')

vim.keymap.set("i", "<C-Up>", '<Esc>V"ayV"_d<Up>"aPi')
vim.keymap.set("i", "<C-Down>", '<Esc>V"ayV"_d"api')

vim.keymap.set("v", "<C-Up>", '"aygv"_d<Up>"aP`[V`]')
vim.keymap.set("v", "<C-Down>", '"aygv"_d"ap`[V`]')

-- make braces
vim.keymap.set("n", "<leader>bc", 'a()<Left>')

-- squirly brace
vim.api.nvim_set_keymap('n', '<leader>sb', 'A{<CR>}<ESC>O', { noremap = true, silent = true })

-- make stringy boi
vim.keymap.set("n", "<leader>str", 'a""<Left>')

-- multi-line string split
vim.keymap.set("n", "<leader>ss", 'a" +<CR>"')

-- GPT
vim.keymap.set("n", "<leader>gpt", vim.cmd.GpChatToggle)
vim.keymap.set("n", "<leader>gpn", vim.cmd.GpChatNew)

-- jumping around global marks
vim.api.nvim_set_keymap('n', '<leader>jh', [[<Cmd>normal! 'H<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>jt', [[<Cmd>normal! 'T<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>jn', [[<Cmd>normal! 'N<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>js', [[<Cmd>normal! 'S<CR>]], { noremap = true })

-- jump to line number
vim.api.nvim_set_keymap('n', '<leader>jl', ':', { noremap = true })
-- jump to byte offset in buffer
vim.api.nvim_set_keymap('n', '<leader>jb', ':goto ', { noremap = true })

-- case insensitive search
vim.keymap.set("n", "<leader>/", "/\\c")

-- git
vim.keymap.set("n", "<leader>lg", ':LazyGit<CR>');

-- save my pinkies
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>on', ':on<CR>', { noremap = true, silent = true })

-- clear line
vim.api.nvim_set_keymap('n', '<C-s>', '<ESC>S', { noremap = true, silent = true })


-- system clipboard
vim.keymap.set('n', '<leader>pc', '"+p<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>pc', '"+p<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>yc', '"+y<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>yc', '"+y<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ya', 'mYggVG"+y<CR>\'Y', { noremap = true, silent = true })

-- reset font size
vim.keymap.set("n", "<leader>rfs", ":set guifont=FiraCode\\ Nerd\\ Font\\ Mono:h16")

-- convert spaces to tabs
vim.keymap.set("n", "<leader>tab", ":set noet<CR>:%retab!<CR>")

-- fold up/out
vim.keymap.set("n", "<leader>fu", "zc")
vim.keymap.set("n", "<leader>fo", "zo")

-- lsp stuff
vim.keymap.set("n", "<leader>lspr", ":LspRestart<CR>")
vim.keymap.set("n", "<leader>lspi", ":LspInfo<CR>")

-- find highlight groups
vim.keymap.set("n", "<leader>hl", ":Inspect<CR>")

-- autoindent entire file
vim.keymap.set('n', '<leader>ind', 'gg=G<C-o>zz')

-- toggle delay training
vim.keymap.set('n', '<leader>dt', ':DelayTrainToggle<CR>');

-- smooth fade for neovide transparency
local DELAY = 10
local ITERATIONS = 20
local OPACITY = 0.5

local function showWallpaper()
    local vl = vim.loop
    for ii = 0, ITERATIONS do
        vl.sleep(DELAY)
        local progress = ii / ITERATIONS
        vim.g.neovide_transparency = 1.0 - (progress * (1.0 - OPACITY))
    end
    vim.g.neovide_transparency = OPACITY
end

local function hideWallpaper()
    local vl = vim.loop
    for ii = 0, ITERATIONS do
        vl.sleep(DELAY)
        local progress = ii / ITERATIONS
        vim.g.neovide_transparency = OPACITY + progress * (1.0 - OPACITY)
    end
    vim.g.neovide_transparency = 1.0
end

vim.keymap.set('n', '<leader>swp', showWallpaper, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>hwp', hideWallpaper, { noremap = true, silent = true })

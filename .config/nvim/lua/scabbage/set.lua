vim.o.guifont = "FiraCode\\ Nerd\\ Font\\ Mono:h16"
vim.g.neovide_transparency = 0.6
vim.g.neovide_hide_mouse_when_typing = true
vim.opt.termguicolors = true

-- stop the # char from removing indentation
vim.api.nvim_set_keymap('i', '#', 'X<C-h>#', {noremap = true})

-- set listchars=tab:>-,space:•,trail:.
vim.opt.listchars = {
    tab=">-",
    space="·",
    trail="#"
}

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"

vim.updatetime = "100"

vim.g.mapleader = " "
vim.opt.mouse = ""

vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

vim.opt.clipboard = "unnamed"

vim.opt.textwidth = 100;

-- backups/swap clutter up file watchers, so yeet them
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

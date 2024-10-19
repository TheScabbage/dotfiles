vim.g.mapleader = " "

vim.keymap.set("n", "<leader>nt", ":vs<CR><C-w>w15<C-w><:term<CR>", { desc = 'Open new terminal' })
vim.keymap.set("t", "<C-ESC>", "<C-\\><C-n>", { noremap = true, silent = true, desc = 'Exit terminal window' })

vim.keymap.set("n", "<leader><Right>", "5<C-w>>", { desc = 'Expand window horizontally' })
vim.keymap.set("n", "<leader><Left>", "5<C-w><", { desc = 'Contract window horizontally' })
vim.keymap.set("n", "<leader><Up>", "5<C-w>+", { desc = 'Expand window vertically' })
vim.keymap.set("n", "<leader><Down>", "5<C-w>-", { desc = 'Contract window vertically' })

vim.keymap.set("n", "<leader>pf", ":Oil<CR>:lua Colorify(nil, true)<CR>", { desc = 'Project files' })

vim.keymap.set("n", "<leader>leu", function() vim.cmd('set ff=unix') end, { desc = 'Convert line endings to Unix (\\n)' })

-- move lines up/down
vim.keymap.set("n", "<C-Up>", 'V"xd<Up>"xP', { desc = 'Move line up' })
vim.keymap.set("n", "<C-Down>", 'V"xd"xp', { desc = 'Move line down' })

vim.keymap.set("i", "<C-Up>", '<Esc>V"xd<Up>"xPi', { desc = 'Move line up' })
vim.keymap.set("i", "<C-Down>", '<Esc>V"xd"xpi', { desc = 'Move line down' })

vim.keymap.set("v", "<C-Up>", '"aygv"_d<Up>"aP`[V`]', { desc = 'Move line up' })
vim.keymap.set("v", "<C-Down>", '"aygv"_d"ap`[V`]', { desc = 'Move line down' })

vim.api.nvim_set_keymap('n', '<leader>sb', 'A{<CR>}<ESC>O',
    { noremap = true, silent = true, desc = 'Snippet: squirly braces' })

vim.api.nvim_set_keymap('n', '<leader>sp', 'A()<Left>', { noremap = true, silent = true, desc = 'Snipped: parens' })

vim.keymap.set("n", "<leader>sfp", 'a"", .{}<ESC>5<left>i',
    { noremap = true, silent = true, desc = 'Snippet: formatted print (Zig)' });

vim.keymap.set("n", "<leader>str", 'a""<Left>', { desc = 'Make string' })
vim.keymap.set("n", "<leader>ss", 'a" +<CR>"', { desc = 'String split (multiline)' })

vim.api.nvim_set_keymap('n', '<leader>jh', [[<Cmd>normal! 'H<CR>]], { noremap = true, desc = 'Jump to global mark H' })
vim.api.nvim_set_keymap('n', '<leader>jt', [[<Cmd>normal! 'T<CR>]], { noremap = true, desc = 'Jump to global mark T' })
vim.api.nvim_set_keymap('n', '<leader>jn', [[<Cmd>normal! 'N<CR>]], { noremap = true, desc = 'Jump to global mark N' })
vim.api.nvim_set_keymap('n', '<leader>js', [[<Cmd>normal! 'S<CR>]], { noremap = true, desc = 'Jump to global mark S' })

vim.keymap.set('n', '<C-n>', ':cnext<CR>', { desc = 'Go to next item in quickfix list' });
vim.keymap.set('n', '<C-p>', ':cprev<CR>', { desc = 'Go to prev item in quickfix list' });

vim.api.nvim_set_keymap('n', '<leader>jb', ':goto ', { noremap = true, desc = 'Jump to byte' })

vim.keymap.set("n", "<leader>lg", ':LazyGit<CR>', { desc = 'Open LazyGit' });

-- save my pinkies
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true, desc = 'Write current buffer' })
vim.api.nvim_set_keymap('n', '<leader>q', ':q', { noremap = true, desc = 'Quit current buffer' })
vim.api.nvim_set_keymap('n', '<leader>on', ':on<CR>', { noremap = true, silent = true, desc = 'Only current buffer' })
vim.api.nvim_set_keymap('n', '<leader>bd', ':bdelete<CR>', { noremap = true, desc = 'Buffer delete' })

vim.api.nvim_set_keymap('i', '<C-s>', '<ESC>S', { noremap = true, silent = true, desc = 'Delete line' })

vim.keymap.set('n', '<leader>pc', '"+p<CR>', { noremap = true, silent = true, desc = 'Paste clipboard' })
vim.keymap.set('v', '<leader>pc', '"+p<CR>', { noremap = true, silent = true, desc = 'Paste clipboard' })

vim.keymap.set('n', '<leader>yc', '"+y<CR>', { noremap = true, silent = true, desc = 'Yank to clipboard' })
vim.keymap.set('v', '<leader>yc', '"+y<CR>', { noremap = true, silent = true, desc = 'Yank to clipboard' })
vim.keymap.set('n', '<leader>ya', 'mYggVG"+y<CR>\'Y', { noremap = true, silent = true, desc = 'Yank all to clipboard' })

vim.keymap.set("n", "<leader>rfs", ":set guifont=FiraCode\\ Nerd\\ Font\\ Mono:h16", { desc = 'Reset font size' })

vim.keymap.set("n", "<leader>tab", ":set noet<CR>:%retab!<CR>", { desc = 'Convert spaces to tabs' })

vim.keymap.set("n", "<leader>fu", "zc", { desc = 'Fold up' })
vim.keymap.set("n", "<leader>fo", "zo", { desc = 'Fold out' })

vim.keymap.set("n", "<leader>lspr", ":LspRestart<CR>", { desc = 'LSP restart' })
vim.keymap.set("n", "<leader>lspi", ":LspInfo<CR>", { desc = 'LSP info' })

vim.keymap.set("n", "<leader>hl", ":Inspect<CR>", { desc = 'Show highlights' })

vim.keymap.set("n", "<leader>col", ":lua Colorify(nil, true)<CR>", { desc = 'Colorise' })

-- Workaround for uncoloured icons when jumping back to Oil via tag stack
--vim.keymap.set("n", "<C-o>", "<C-o>:lua Colorify(nil, true)<CR>");
--vim.keymap.set("n", "<C-i>", "<C-i>:lua Colorify(nil, true)<CR>");

vim.keymap.set('n', '<leader>ind', 'gg=G<C-o>zz', { desc = 'Indent entire buffer' })

-- Compile mode
vim.keymap.set('n', '<leader>cmp', ':Compile<CR>', { desc = 'Compile' });
vim.keymap.set('n', '<leader>cn', ':NextError<CR>', { desc = 'Next compile error' });
vim.keymap.set('n', '<leader>cp', ':PrevError<CR>', { desc = 'Prev compile error' });

-- Quickfix filtering
local function filter_quickfix_list(substring, filter_type)
    filter_type = filter_type or 'text'

    local textFilter = function(item)
        return string.find(item.text, substring, 1, true)
    end

    local pathFilter = function(item)
        local path = vim.fn.bufname(item.bufnr)
        return string.find(path, substring, 1, true)
    end

    local filter = textFilter;
    if filter_type == 'path' then
        filter = pathFilter
    end

    local new_list = vim.tbl_filter(filter, vim.fn.getqflist())

    vim.fn.setqflist(new_list)
end

vim.api.nvim_create_user_command(
    'QFilterText',
    function(opts)
        filter_quickfix_list(opts.args, 'text')
    end,
    { nargs = 1, complete = 'file' }
)

vim.api.nvim_create_user_command(
    'QFilterPath',
    function(opts)
        filter_quickfix_list(opts.args, 'path')
    end,
    { nargs = 1, complete = 'file' }
)

-- toggle delay training
--vim.keymap.set('n', '<leader>dt', ':DelayTrainToggle<CR>');

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

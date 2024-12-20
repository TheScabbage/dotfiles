return {
    {
        'TheScabbage/evergarden',
        lazy = false,
        priority = 1000,
        config = function(_)
            vim.cmd [[colorscheme evergarden]]
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        end
    },
    'AlexvZyl/nordic.nvim',
    'ribru17/bamboo.nvim',
    'romainl/Apprentice',
    {'catppuccin/nvim', name = 'catppuccin'},
    'bluz71/vim-nightfly-colors',
    'jacoborus/tender.vim',
    'Mofiqul/vscode.nvim',
    'rebelot/kanagawa.nvim',
    'fcpg/vim-farout',
    'w0ng/vim-hybrid',
    'morhetz/gruvbox',
    { 'rose-pine/neovim', name = 'rose-pine' },
}

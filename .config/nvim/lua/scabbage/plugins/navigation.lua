return {
    {
        'nvim-telescope/telescope.nvim',
        version = "0.1.8",
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        "TheScabbage/project.nvim",
        config = function(_)
            require("project_nvim").setup {}
        end,
    },
    "nvim-telescope/telescope-ui-select.nvim",
    "stevearc/oil.nvim",
    "christoomey/vim-tmux-navigator",
    {
        'TheScabbage/cinnamon.nvim',
        config = function(_) require('cinnamon').setup() end
    },
}

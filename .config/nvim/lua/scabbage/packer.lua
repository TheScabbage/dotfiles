-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local packer = require('packer')
packer.init {
    -- Gotta limit jobs otherwise they fail
    max_jobs = 1,
}

return packer.startup(function(use)
    -- Self-managed packer cuz he a clever boi
    use 'wbthomason/packer.nvim'

    -- Colour themes
    use 'bluz71/vim-nightfly-colors'
    use 'jacoborus/tender.vim'
    use 'Mofiqul/vscode.nvim'
    use 'rebelot/kanagawa.nvim'
    use 'fcpg/vim-farout'
    use 'w0ng/vim-hybrid'
    use({ 'monsonjeremy/onedark.nvim', branch = 'treesitter' })
    use 'morhetz/gruvbox'

    -- Telescope go brr
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        'nvim-telescope/telescope-ui-select.nvim',

        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Frecency
    use {
        'nvim-telescope/telescope-frecency.nvim',
        config = function()
            require('telescope').load_extension 'frecency'
        end,
    }

    -- Syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use 'nvim-treesitter/playground'

    -- Indentation detection
    use {
        'nmac427/guess-indent.nvim',
        config = function() require('guess-indent').setup {} end,
    }

    -- Git
    use 'tpope/vim-fugitive'
    use 'junegunn/gv.vim'

    use 'ThePrimeagen/git-worktree.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Lazygit
    use({
        "kdheepak/lazygit.nvim",
        requires = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("lazygit")
        end,
    })

    -- LSP
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'Hoffs/omnisharp-extended-lsp.nvim'
    }

    -- Origami that shit
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

    -- Completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline'
        }
    }
    use {
        'L3MON4D3/LuaSnip',
        tag = 'v2.*',
        run = 'make install_jsregexp'
    }

    -- TMUX
    use 'christoomey/vim-tmux-navigator'

    -- Smooth scrolling
    use {
        'declancm/cinnamon.nvim',
        config = function() require('cinnamon').setup() end
    }


    -- ChatGPT integration
    -- packer.nvim
    use({
        'robitx/gp.nvim',
        config = function()
            require('gp').setup()
        end,
    })
end)

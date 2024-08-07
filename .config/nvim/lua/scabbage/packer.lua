-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local packer = require('packer')

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
    use 'comfysage/evergarden'
    use({ 'monsonjeremy/onedark.nvim', branch = 'treesitter' })
    use 'morhetz/gruvbox'

    -- Telescope go brr
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        'nvim-telescope/telescope-ui-select.nvim',

        use {
          "TheScabbage/project.nvim",
          config = function()
                require("project_nvim").setup {
            }
          end
        },
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

    -- Surround
    use 'tpope/vim-surround'

    -- Git
    use 'junegunn/gv.vim'

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
        'Hoffs/omnisharp-extended-lsp.nvim',
        'simrat39/rust-tools.nvim',
    }

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

    -- ew java
    --use 'mfussenegger/nvim-jdtls'

    -- Origami that shit
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }


    use {
        'L3MON4D3/LuaSnip',
        tag = 'v2.*',
        run = 'make install_jsregexp'
    }

    -- TMUX
    use 'christoomey/vim-tmux-navigator'

    -- Smooth scrolling
    use {
        'TheScabbage/cinnamon.nvim',
        config = function() require('cinnamon').setup() end
    }

    -- Stop being shit
    --use 'ja-ford/delaytrain.nvim'

    -- Colour the chungus lines
    use 'whatyouhide/vim-lengthmatters'

    -- File tree
    use "stevearc/oil.nvim"

    if packer_bootstrap then
    	require('packer').sync()
    end
end)

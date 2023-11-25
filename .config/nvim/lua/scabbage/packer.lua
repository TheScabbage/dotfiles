-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Self-managed packer cuz he a clever boi
  use 'wbthomason/packer.nvim'

  -- Colour themes
  use "bluz71/vim-nightfly-colors"
  use "jacoborus/tender.vim"
  use "rebelot/kanagawa.nvim"

  -- Telescope go brr
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Syntax highlighting
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end,
  }

  use('nvim-treesitter/playground')

  -- Git
  use('tpope/vim-fugitive')


  -- LSP
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }

  -- Completion
  use {
      "hrsh7th/nvim-cmp",
      requires = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-cmdline"
      }
  }

  use{
      "L3MON4D3/LuaSnip",
      tag = "v2.*",
      run = "make install_jsregexp"
  }

  -- TMUX
  use {'christoomey/vim-tmux-navigator'}


  -- Smooth scrolling
  use {
      'declancm/cinnamon.nvim',
      config = function() require('cinnamon').setup() end
  }


  -- ChatGPT integration
  use({
      "jackMort/ChatGPT.nvim",
      config = function()
          require("chatgpt").setup()
      end,
      requires = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope.nvim"
      }
  })

end)

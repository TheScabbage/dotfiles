-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- colour themes
  use "bluz71/vim-nightfly-colors"
  use "jacoborus/tender.vim"
  use "rebelot/kanagawa.nvim"

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }


  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end,
  }

  use('nvim-treesitter/playground')

  use('tpope/vim-fugitive')

  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }

  use{
      "L3MON4D3/LuaSnip",
      tag = "v2.*",
      run = "make install_jsregexp"
  }

  use {
      "hrsh7th/nvim-cmp",
      requires = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-cmdline"
      }
  }


  use {'christoomey/vim-tmux-navigator'}

  use {
      'declancm/cinnamon.nvim',
      config = function() require('cinnamon').setup() end
  }

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

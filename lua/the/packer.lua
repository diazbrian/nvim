-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Git
  use("tpope/vim-fugitive")


  -- Themes
  use 'folke/tokyonight.nvim'

  use({ 'rose-pine/neovim', as = 'rose-pine' })

  use 'navarasu/onedark.nvim' require('onedark').setup {
      style = 'warmer', -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      highlights = {
          TelescopeBorder = { fg = 'white'}, -- title
          TelescopeResultsBorder = { fg = 'grey'},
          TelescopePreviewBorder = { fg = 'grey'},
          TelescopePromptBorder = { fg = 'grey'},
      },
  }

  require('onedark').load() -- This line to set the theme
  -- vim.cmd('colorscheme rose-pine')
  -- vim.cmd('colorscheme tokyonight-night')


  -- Visual status, buffers
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons'} }

  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  use 'nvim-tree/nvim-web-devicons'


  -- File Explorer
  use { 'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons'} -- optional for icons


  -- Indent
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end } require('Comment').setup()

  use 'NvChad/nvim-colorizer.lua' -- Colors code

  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }

  use "lukas-reineke/indent-blankline.nvim"
  require("indent_blankline").setup {
      -- for example, context is off by default, use this to turn it on
      show_current_context = true,
      show_current_context_start = false,
  }

  -- LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
end)

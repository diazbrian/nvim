return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'warmer', -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        colors = {
          bg0 = '#1f1f1f',
          bg3 = "#3a303b", -- visual mode color
          light_grey = "#a7aab0",
          grey = "#646568",
          fg = "#cbcbcb"
        },
        ending_tildes = true,
        code_style = {
          comments = 'none',
        },
        highlights = {
          TelescopeBorder = { fg = 'white' }, -- title
          TelescopeResultsBorder = { fg = 'grey' },
          TelescopePreviewBorder = { fg = 'grey' },
          TelescopePromptBorder = { fg = 'grey' },
        },
      }
      vim.cmd.colorscheme("onedark")
      vim.cmd('highlight WinSeparator guibg=none guifg=#666')
    end
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    event = "VeryLazy",
    opts = {
      variant = 'dawn',
      disable_italics = true
    }
  },

  -- {
  --   'wuelnerdotexe/vim-enfocado',
  --   -- priority = 1000,
  --   config = function()
  --     vim.api.nvim_set_var("enfocado_style", "neon")
  --     -- vim.opt.background = "light"
  --     -- vim.cmd.colorscheme("enfocado")
  --   end
  -- }
  -- {
  -- 	"nyoom-engineering/oxocarbon.nvim",
  -- 	-- lazy = false,
  -- 	priority = 1000,
  -- 	config = function ()
  -- 		vim.cmd.colorscheme("oxocarbon")
  -- 		vim.opt.background = "dark"
  -- 	end,
  -- },

  -- {
  -- 	"loctvl842/monokai-pro.nvim",
  -- 	-- lazy = false,
  -- 	-- priority = 1000,
  -- 	config = function ()
  -- 		require("monokai-pro").setup()
  -- 	end,
  -- },
}

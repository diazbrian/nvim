return {
	{
		"nyoom-engineering/oxocarbon.nvim",
		-- lazy = false,
		-- priority = 1000,
		config = function ()
			-- vim.cmd.colorscheme("oxocarbon")
			-- vim.opt.background = "light"
		end,
	},

	{
		"loctvl842/monokai-pro.nvim",
		-- lazy = false,
		-- priority = 1000,
		config = function ()
			require("monokai-pro").setup()
		end,
	},

	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function ()
			require('onedark').setup  {
				style = 'warmer', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
				colors = {
				},
				ending_tildes = true,
				code_style = {
					comments = 'none',
				},
				highlights = {
					TelescopeBorder = { fg = 'white'}, -- title
					TelescopeResultsBorder = { fg = 'grey'},
					TelescopePreviewBorder = { fg = 'grey'},
					TelescopePromptBorder = { fg = 'grey'},
				},
			}
			vim.cmd.colorscheme("onedark")
		end
	},
}

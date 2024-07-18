return {
	'nvim-tree/nvim-tree.lua',
	dependencies = {'nvim-tree/nvim-web-devicons' },
	keys = {
		{"<A-n>", "<cmd>NvimTreeToggle<CR>"},
		{"<A-f>", "<cmd>NvimTreeFindFileToggle<CR>"},
	},
	config = function ()
		local function my_on_attach(bufnr)
			local api = require "nvim-tree.api"

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set('n', '<C-H>', api.tree.change_root_to_parent,        opts('Up'))
			vim.keymap.set('n', '<C-L>', api.tree.change_root_to_node,        opts('Down'))
		end

		require("nvim-tree").setup{
			on_attach = my_on_attach,
			renderer = {
				icons = {
					show = {
						folder_arrow = false,
						git = false,
						modified = false,
					},
				},
				indent_markers = {
					enable = true,
				},
			},
			filters = {
				dotfiles = true,
			},
		}

		-- vim.keymap.set("n", "<A-n>", "<cmd>NvimTreeToggle<CR>")
	end
}

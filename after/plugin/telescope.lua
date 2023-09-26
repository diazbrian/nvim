local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

vim.keymap.set('n', '<leader>F', builtin.find_files, {})
vim.keymap.set('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>rr', '<cmd>Telescope lsp_references<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ds', '<cmd>Telescope lsp_document_symbols<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>g', function()
	builtin.live_grep({
		layout_strategy = 'vertical',
		layout_config = {
			width = 0.7,
		}
	})
end)

vim.keymap.set('n', '<leader><leader>', function()
	builtin.current_buffer_fuzzy_find({
		layout_strategy = 'vertical',
		layout_config = {
			width = 0.7,
		}
	})
end)

vim.keymap.set('n', '<leader>ed', function()
	builtin.find_files(themes.get_dropdown {
		prompt_title = " nvim config ",
		cwd = "~/AppData/Local/nvim/",
		layout_config = {
			prompt_position = "top",
			width = 0.6,
		},
		-- layout_strategy ='vertical',
	})
end)

require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<C-s>"] = "select_horizontal",
			}
		}
	},
}

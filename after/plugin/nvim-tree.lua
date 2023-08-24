require("nvim-tree").setup({
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
})

vim.keymap.set("n", "<leader>N", ":NvimTreeToggle<CR>")

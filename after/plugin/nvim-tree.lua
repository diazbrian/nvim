require("nvim-tree").setup({
  renderer = {
      indent_markers = {
          enable = true,
      },
  },
  filters = {
      dotfiles = true,
  },
})

vim.keymap.set("n", "<leader>N", ":NvimTreeToggle<CR>")

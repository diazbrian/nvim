return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
      -- char = "▎",
      -- tab_char = "▎",
    },
    scope = {
      enabled = true,
      char = "│",
      show_start = false,
      show_end = false,
    },
    whitespace = {
      -- highlight = { "Function" },
    }
  }
}

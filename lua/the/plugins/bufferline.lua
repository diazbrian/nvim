return {
  'akinsho/bufferline.nvim',
  version = "*",
  -- dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup {
      options = {
        style_preset = {
          bufferline.style_preset.no_italic,
          bufferline.style_preset.no_bold,
        },
        diagnostics = "nvim_lsp",
        separator_style = { '', '' }, -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
        show_buffer_icons = false,
        buffer_close_icon = 'x',
        indicator = {
          style = 'none',
        },
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true -- use a "true" to enable the default, or set your own character
          }
        },
      },
    }
  end
}

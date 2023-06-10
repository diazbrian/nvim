local bufferline = require('bufferline')
bufferline.setup {
    options = {
        separator_style = "slant",
        buffer_close_icon = '󰅖',
        -- indicator = {
        --     style = 'underline',
        --     color = 'green',
        -- },
        hover = {
            enabled = true,
            delay = 0,
            reveal = {'close'}
        },
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            }
        }
      },
}

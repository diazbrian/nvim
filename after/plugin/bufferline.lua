local bufferline = require('bufferline')
bufferline.setup {
	options = {
		style_preset = bufferline.style_preset.no_italic,
        separator_style = "slant",
        buffer_close_icon = '󰅖',
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            }
        },
		hover = {
			enabled = true,
			delay = 100,
			reveal = {'close'}
		}
	},
}

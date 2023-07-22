local bufferline = require('bufferline')
bufferline.setup {
	options = {
		style_preset = bufferline.style_preset.no_italic,
		-- show_buffer_icons = false, -- disable filetype icons for buffers
		buffer_close_icon = '×',
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
		hover = {
			enabled = true,
			delay = 100,
			reveal = {'close'}
		}
	},
}

local colors = {
	-- bg       = '#202328',
	-- bg       = '#333338',
	fg       = '#bbc2cf',
	yellow   = '#ECBE7B',
	cyan     = '#008080',
	darkblue = '#081633',
	green    = '#98be65',
	orange   = '#FF8800',
	violet   = '#a9a1e1',
	magenta  = '#c678dd',
	blue     = '#51afef',
	red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local function lsp_server_name()
	local msg = ''
	local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return client.name
		end
	end
	return msg
end

require('lualine').setup {
	options = {
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		globalstatus = true,
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{ 'filesize' },
			{ 'filename', path = 1, cond = conditions.buffer_not_empty, color = { fg = colors.magenta, gui = 'bold' } },
			'progress', 'location', 'diagnostics'
		},
		lualine_x = {
			{ lsp_server_name, icon = ' ', color = { fg = '#888888' } },
			'branch', 'diff', { 'encoding', fmt = string.upper, color = { fg = colors.blue } },
			{ 'fileformat', icons_enabled = false, fmt = string.upper, color = { fg = colors.green }, cond = conditions.buffer_not_empty, }
		},
		lualine_y = {},
		lualine_z = {}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { 'filename' } },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}

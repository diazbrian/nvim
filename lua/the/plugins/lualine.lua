return {
  'nvim-lualine/lualine.nvim',
  -- enabled = false,
  -- dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local colors = {
      fg      = '#cccccc',
      yellow  = '#ECBE7B',
      cyan    = '#008080',
      green   = '#98be65',
      orange  = '#FF8800',
      magenta = '#c678dd',
      blue    = '#51afef',
      red     = '#ec5f67',
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
      end,
    }

    local config = {
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
          { 'filename', path = 1 }
        },
        lualine_x = {
          { 'diagnostics', symbols = {error = 'E ', warn = 'W ', info = 'I ', hint = 'H '}, },
          { 'branch', icon = '', color = { fg = '#888888', gui = 'bold' } },
          -- {
          --   'diff',
          --   diff_color = {
          --     added = { fg = colors.green },
          --     modified = { fg = colors.orange },
          --     removed = { fg = colors.red },
          --   },
          -- },
          -- { 'encoding', fmt = string.upper, color = { fg = colors.blue } },
          -- {
          --   'fileformat',
          --   symbols = { unix = 'LF', dos = 'CRLF' },
          --   icons_enabled = true,
          --   -- color = { fg = 'magenta' },
          --   cond = conditions.buffer_not_empty,
          -- },
          { 'filesize', --[[ color = { fg = colors.magenta } ]] },
          { 'location'--[[ , color = { fg = colors.magenta } ]] },
          { 'progress'--[[ , color = { fg = colors.green } ]] },
        },
        lualine_y = {},
        lualine_z = {}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
    }

    require('lualine').setup(config)
  end
}

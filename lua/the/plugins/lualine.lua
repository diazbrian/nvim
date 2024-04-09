return {
  'nvim-lualine/lualine.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
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
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
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
          {
            'filename',
            path = 1,
            -- color = {
            --   -- fg = colors.fg,
            --   gui = 'bold'
            -- }
          },
          { 'progress' },
          { 'location' }
        },
        lualine_x = {
          { 'diagnostics', },
          { 'branch', icon = '', color = { fg = '#888888', gui = 'bold' } },
          {
            'diff',
            diff_color = {
              added = { fg = colors.green },
              modified = { fg = colors.orange },
              removed = { fg = colors.red },
            },
          },
          { 'encoding', fmt = string.upper, color = { fg = colors.blue } },
          { 'filesize', color = { fg = colors.magenta } },
          {
            'fileformat',
            icons_enabled = false,
            fmt = string.upper,
            color = { fg = colors.green },
            cond = conditions.buffer_not_empty,
          }
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

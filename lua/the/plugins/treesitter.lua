return {
  'nvim-treesitter/nvim-treesitter',
  -- dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
  build = ':TSUpdate',
  config = function()
    require 'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = { "lua", "cpp", "vimdoc" },

      -- Automatically install missing parsers when entering buffer
      auto_install = false,

      highlight = { enable = true, },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<M-space>',
        },
      },
    }
  end
}

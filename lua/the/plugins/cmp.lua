return {
  'hrsh7th/nvim-cmp',
  -- event = "VeryLazy",
  dependencies = {
    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',

    -- for text in buffer and file system paths
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    "hrsh7th/cmp-cmdline",

    -- for neovim autocomplete
    'hrsh7th/cmp-nvim-lua',

    -- Snippets
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',

    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',

    'onsails/lspkind.nvim', -- vs-code like pictograms

  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require("lspkind")
    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        -- noinsert: autoselect first item (so i dont have to press the key twice to select the 2th item)
        completeopt = 'menu,menuone,noinsert'
      },
      matching = {
        disallow_fuzzy_matching = false,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-x>'] = cmp.mapping.abort(),
        ['<C-s>'] = cmp.mapping.complete(),
        ['<C-l>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      },
      sources = {
        -- the order of your sources matter (by dejault). That gives them priority.
        -- you can configure:
        --    keyword_lenght
        --    priority
        --    max_item_count
        --    (more?)
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
      },
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    }

    -- `/` cmdline setup.
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer', max_item_count = 16 }
      }
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline', max_item_count = 16,
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })

    vim.keymap.set({ "i", "s" }, "<c-k>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<c-j>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { silent = true })
  end
}

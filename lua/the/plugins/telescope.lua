return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { { 'nvim-lua/plenary.nvim' } },
  config = function()
    local builtin = require('telescope.builtin')
    local themes = require('telescope.themes')

    vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {})
    vim.keymap.set('n', '<leader>so', builtin.oldfiles, {})
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
    -- vim.keymap.set('n', '<leader>sr', '<cmd>Telescope lsp_references<CR>', { noremap = true, silent = true })

    vim.keymap.set('n', '<leader>ds', function()
      builtin.lsp_document_symbols({
        layout_config = {
          preview_width = 80,
        }
      })
    end)

    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end)

    vim.keymap.set('n', '<leader>sg', function()
      builtin.live_grep({
        layout_strategy = 'vertical',
        layout_config = {
          width = 0.7,
        }
      })
    end)

    vim.keymap.set('n', '<leader><leader>', function()
      builtin.current_buffer_fuzzy_find(themes.get_dropdown{
        previewer = false,
      })
    end)

    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files(themes.get_dropdown {
        prompt_title = " nvim config ",
        cwd = "~/AppData/Local/nvim/",
        layout_config = {
          prompt_position = "top",
          width = 0.6,
        },
      })
    end)

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ["<C-s>"] = "select_horizontal",
            -- ["<C-k>"] = "preview_scrolling_righ",
            -- ["<C-f>"] = "preview_scrolling_left",
          }
        }
      },
    }
  end
}

return {
  -- { 'VonHeikemen/lsp-zero.nvim',        branch = 'v1.x', },
  -- LSP Support
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    -- { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
  },
  config = function()
    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

      nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
      nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      nmap('<C-k>', vim.diagnostic.goto_prev, 'Prev diagnostic')
      nmap('<C-j>', vim.diagnostic.goto_next, 'Prev diagnostic')
      nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
      -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

      nmap('<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', '[W]orkspace [L]ist')
      nmap('<leader>lwa', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [A]dd')
      nmap('<leader>lwr', vim.lsp.buf.add_workspace_folder, '[W]orkspace [R]emove')

      -- See `:help K` for why this keymap
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<leader>K', vim.lsp.buf.signature_help, 'Signature Documentation')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    local servers = {
      clangd = {},
      lua_ls = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
      tsserver = {
        diagnostics = { ignoredCodes = {
          6133, 80001
        } }
      }

    }

    -- vim.diagnostic.config({
    --   virtual_text = true,
    --   underline = true,
    --   sign = true,
    -- })

    local signs = { Error = "● ", Warn = "● ", Hint = "● ", Info = "● " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end
    }
  end
}

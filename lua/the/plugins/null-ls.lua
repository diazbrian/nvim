return {
  "jose-elias-alvarez/null-ls.nvim",
  ft = { "py" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
      },
    })

  end
}

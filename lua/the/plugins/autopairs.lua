return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require('nvim-autopairs').setup({
      enable_check_bracket_line = true,
      fast_wrap = {},
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    -- make autopairs and completion work together
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end
}

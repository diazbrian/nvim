return {
  'Exafunction/codeium.vim',
  -- enabled = false,
  event = 'BufEnter',
  config = function ()
    vim.g.codeium_idle_delay = 200
  end
}
-- return {
--   "Exafunction/codeium.nvim",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "hrsh7th/nvim-cmp",
--   },
--   config = function()
--     require("codeium").setup({
--     })
--   end
-- }

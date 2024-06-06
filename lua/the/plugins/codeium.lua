return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function ()
    vim.g.codeium_idle_delay = 200
  end
}

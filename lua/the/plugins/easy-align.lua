return {
  'junegunn/vim-easy-align',
  -- event = 'VeryLazy',
  init = function()
    vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)')
    vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)')
  end
}

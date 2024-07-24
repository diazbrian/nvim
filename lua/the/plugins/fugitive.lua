return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

    -- Git branch
    vim.keymap.set('n', '<leader>gb', '<cmd>Git branch<CR>')
  end
}

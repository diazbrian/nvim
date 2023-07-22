vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number,line"
vim.opt.scrolloff = 8
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.list = true
vim.opt.listchars = {
  trail = '·',
  tab = '│ ',
  extends = '▶',
  precedes = '◀',
}

vim.opt.swapfile = false
vim.opt.updatetime = 50
vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
-- vim.opt.guicursor = ""
-- vim.opt.colorcolumn = "80"
-- vim.opt.mousemoveevent = true

-- .

-- highlight when yank something
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 120,
        })
    end,
})

-- set personal cursorline & number
vim.cmd('highlight CursorLineNr gui=bold guifg=#fff')
vim.cmd('highlight CursorLine gui=underline guibg=none')

-- augroup vimrc-incsearch-highlight
-- autocmd!
-- autocmd CmdlineEnter /,\? :set hlsearch
-- autocmd CmdlineLeave /,\? :set nohlsearch
-- augroup END

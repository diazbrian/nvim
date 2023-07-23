vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number,line"
vim.opt.scrolloff = 8
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

-- Убирает подсветку после поиска после ухода со строки (auto highlight on search)
vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
    if vim.opt.hlsearch:get() ~= new_hlsearch then vim.opt.hlsearch = new_hlsearch end
  end
end, vim.api.nvim_create_namespace "auto_hlsearch")

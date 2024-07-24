require("the.set")
require("the.remap")
require("the.lazy")


-- highlight current line number
vim.cmd('highlight CursorLineNr gui=bold guifg=#fff')

-- set language on Windows
if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.cmd('language en_US')
end

vim.g.netrw_banner = 0
vim.g.netrw_sort_by = "exten"
vim.g.netrw_list_hide = "^./$"
-- vim.g.netrw_winsize = 25
-- vim.g.netrw_cursor = 4

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

-- remove end spaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd [[%s/\s\+$//e]]
    vim.cmd [[%s/\n\+\%$//e]]
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Убирает подсветку после поиска после ухода со строки (auto highlight on search)
-- vim.on_key(function(char)
--   if vim.fn.mode() == "n" then
--     local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
--     if vim.opt.hlsearch:get() ~= new_hlsearch then vim.opt.hlsearch = new_hlsearch end
--   end
-- end, vim.api.nvim_create_namespace "auto_hlsearch")

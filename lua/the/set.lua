vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.expandtab = true -- Use the spaces to insert a <Tab>.  To insert a real tab use CTRL-V<Tab>
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.updatetime = 50
vim.opt.clipboard = "unnamedplus"

-- vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.signcolumn = "yes"
vim.opt.guicursor = "n-c-sm:blinkoff800-blinkon800,i-ci-ve:ver25,r-cr-o:hor30" -- n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
vim.opt.termguicolors = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 1
vim.opt.foldcolumn = "1"
vim.opt.foldtext = [['+-- ' . substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
vim.opt.fillchars = {
  fold = " ",
  foldopen = "󰅀",
  foldclose = "󰅂",
  foldsep = " ",
}

vim.opt.list = true
vim.opt.listchars = {
  trail = '·',
  tab = '│ ',
  extends = '▶',
  precedes = '◀',
}

vim.cmd('highlight CursorLineNr gui=bold guifg=#fff')
vim.cmd('language en_US')
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_cursor = 4

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

-- Убирает подсветку после поиска после ухода со строки (auto highlight on search)
-- vim.on_key(function(char)
--   if vim.fn.mode() == "n" then
--     local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
--     if vim.opt.hlsearch:get() ~= new_hlsearch then vim.opt.hlsearch = new_hlsearch end
--   end
-- end, vim.api.nvim_create_namespace "auto_hlsearch")

-- remove end spaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd [[%s/\s\+$//e]]
    vim.cmd [[%s/\n\+\%$//e]]
    vim.fn.setpos(".", save_cursor)
  end,
})

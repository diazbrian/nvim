vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split" -- show search and replace in a preview window
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

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldlevel = 99
-- vim.opt.foldnestmax = 1
-- vim.opt.foldcolumn = "1"
-- vim.opt.foldtext = [['+-- ' . substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
-- vim.opt.fillchars = {
--   fold = " ",
--   foldopen = "󰅀",
--   foldclose = "󰅂",
--   foldsep = " ",
-- }
--
-- vim.opt.list = true
-- vim.opt.listchars = {
--   trail = '·',
--   tab = '│ ',
--   extends = '▶',
--   precedes = '◀',
-- }

-- vim.opt.laststatus = 3

-- local function statusline()
--   local file_name = " %f "
--   local read_only = "%r"
--   local modyfied = "%m"
--   local align = "%="
--   local diagnostic = #vim.diagnostic.get(0, { severity = { min = vim.diagnostic.severity.WARN } })
--   local linecol = "%3l,%c      "
--   local percent = "%P "
--
--   return string.format("%s%s%s%s%s%s%s", file_name, read_only, modyfied, align, diagnostic, linecol, percent)
-- end
--
-- vim.opt.statusline = statusline()

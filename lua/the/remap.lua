vim.g.mapleader = " "

-- cursor begin/end
-- vim.keymap.set({"n", "v"}, "<C-h>", "_")
-- vim.keymap.set({"n", "v"}, "<C-l>", "$")
vim.keymap.set({"n", "v"}, "<C-h>", "_")
vim.keymap.set({"n", "v"}, "<C-l>", "$")


-- Some emacs keybiding in insert mode
vim.keymap.set("i", "<C-b>", "<Left>")
vim.keymap.set("i", "<C-f>", "<Right>")
vim.keymap.set("i", "<C-a>", "<Home>")
vim.keymap.set("i", "<C-e>", "<End>")
vim.keymap.set("i", "<A-b>", "<C-Left>")
vim.keymap.set("i", "<A-f>", "<C-Right>")
vim.keymap.set("i", "<C-d>", "<Del>")
vim.keymap.set("i", "<A-d>", "<Esc>ldwi")

-- buffer next; prev; delete; save
vim.keymap.set("n", "<C-n>", ":bn<CR>", { silent = true })
vim.keymap.set("n", "<C-p>", ":bp<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":bd<CR>", { silent = true })
vim.keymap.set("n", "<C-n>", ":bn<CR>")
vim.keymap.set("n", "<C-p>", ":bp<CR>")
vim.keymap.set("n", "<leader>q", ":bd<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- select current word to replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- indent in visual mode
vim.keymap.set("v", "<Tab>", ">gv<Esc>")
vim.keymap.set("v", "<S-Tab>", "<gv<Esc>")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- S E X
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- terminal
vim.keymap.set("n", "<A-t>", ":sp<CR>:terminal pwsh<CR>i")
vim.keymap.set("t", "<A-n>", [[<C-\><C-N>]]) -- normal mode in terminal
vim.keymap.set("n", "<A-t>", ":sp<CR><C-w>w:terminal<CR>i")
vim.keymap.set("t", "<A-n>", [[<C-\><C-N>]]) -- normal mode in vim terminal

-- resize split screen
vim.keymap.set("n", "<S-Up>", ":resize -3<CR>", { silent = true })
vim.keymap.set("n", "<S-Down>", ":resize +3<CR>", { silent = true })
vim.keymap.set("n", "<S-Left>", ":vertical resize -3<CR>", { silent = true })
vim.keymap.set("n", "<S-Right>", ":vertical resize +3<CR>", { silent = true })

-- idk
vim.keymap.set("n", "<Tab>", "gt")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "Q", "q")
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "#", "*N")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod u+x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>cpp", ":sp<CR>:resize -4<CR>:terminal cmd /C g++ % -Wall && pause && cls && a.exe<CR>i")
vim.keymap.set("n", "<F10>", "<cmd>!g++ % -Wall && start a.exe<CR>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>l")

-- idk
vim.keymap.set("n", "<leader>cd", ":cd ~/.config/nvim/<CR>")
vim.keymap.set("n", "<leader>cv", ":Ex ~/.config/nvim/lua/the/<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod u+x %<CR>", { silent = true })
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })

vim.g.mapleader = " "

-- cursor begin/end
-- vim.keymap.set({"n", "v"}, "<C-h>", "_")
-- vim.keymap.set({"n", "v"}, "<C-l>", "$")

-- jump wrapped lines
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Some emacs keybiding in insert, command mode
vim.keymap.set({"i", "c"}, "<C-b>", "<Left>")
vim.keymap.set({"i", "c"}, "<C-f>", "<Right>")
vim.keymap.set({"i", "c"}, "<C-a>", "<Home>")
vim.keymap.set("i", "<C-e>", "<End>")
vim.keymap.set({"i", "c"}, "<A-b>", "<C-Left>")
vim.keymap.set({"i", "c"}, "<A-f>", "<C-Right>")
vim.keymap.set({"i", "c"}, "<C-d>", "<Del>")
vim.keymap.set("i", "<A-d>", "<Esc>ldwi")

-- buffer next; prev; delete; save
vim.keymap.set("n", "<C-n>", ":bn<CR>", { silent = true })
vim.keymap.set("n", "<C-p>", ":bp<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":bd<CR>", { silent = true })
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- select current word to replace
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- indent in visual mode
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- S E X
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- terminal
vim.keymap.set("n", "<A-t>", ":sp<CR>:terminal pwsh<CR>i")
vim.keymap.set("t", "<A-n>", [[<C-\><C-N>]]) -- normal mode in terminal

-- resize split screen
vim.keymap.set("n", "<S-Up>", ":resize -3<CR>", { silent = true })
vim.keymap.set("n", "<S-Down>", ":resize +3<CR>", { silent = true })
vim.keymap.set("n", "<S-Left>", ":vertical resize -3<CR>", { silent = true })
vim.keymap.set("n", "<S-Right>", ":vertical resize +3<CR>", { silent = true })

-- select diff
vim.keymap.set("n", "<leader>dh", ":diffget //2<CR>")
vim.keymap.set("n", "<leader>dl", ":diffget //3<CR>")

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

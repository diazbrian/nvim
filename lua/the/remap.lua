vim.g.mapleader = " "

-- cursor begin/end
vim.keymap.set({"n", "v"}, "<C-h>", "_")
vim.keymap.set({"n", "v"}, "<C-l>", "$")

-- buffer next, prev, delete, save
vim.keymap.set("n", "<leader>l", ":bn<CR>")
vim.keymap.set("n", "<leader>h", ":bp<CR>")
vim.keymap.set("n", "<leader>q", ":bd<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- select current word to replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- indent in visual mode
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- S E X
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- terminal
vim.keymap.set("n", "<A-t>", ":sp<CR><C-w>w:terminal<CR>i")
vim.keymap.set("t", "<A-n>", [[<C-\><C-N>]]) -- normal mode in vim terminal

-- resize split screen
vim.keymap.set("n", "<S-Up>", ":resize -3<CR>", { silent = true })
vim.keymap.set("n", "<S-Down>", ":resize +3<CR>", { silent = true })
vim.keymap.set("n", "<S-Left>", ":vertical resize -3<CR>", { silent = true })
vim.keymap.set("n", "<S-Right>", ":vertical resize +3<CR>", { silent = true })

-- This is going to get me cancelled
vim.keymap.set("i", "jj", "<Esc>l")
vim.keymap.set("i", "<C-c>", "<Esc>l")

-- center cursor when move
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- idk
vim.keymap.set("n", "<leader>cd", ":cd ~/.config/nvim/<CR>")
vim.keymap.set("n", "<leader>cv", ":Ex ~/.config/nvim/lua/the/<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod u+x %<CR>", { silent = true })
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

--  go to the [count] next/prev error.
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Same as ":cnext", except the location list for the current window is used instead of the quickfix list.
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

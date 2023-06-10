require("the.packer")
require("the.set")
require("the.remap")


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
            timeout = 90,
        })
    end,
})

-- highlight, bold and white current number line
vim.cmd('highlight CursorLineNr gui=bold guibg=#31353f guifg=#fff')
vim.cmd('highlight CursorLine guibg=#31353f')
-- vim.api.nvim_set_hl(0, "CursorLineNr", {bg = "#404247"})
-- vim.api.nvim_set_hl(0, "CursorLine", {bg = "#404247"})

-- bg0 = "#282c34",
-- bg1 = "#31353f",
-- bg2 = "#393f4a",
-- bg3 = "#3b3f4c",


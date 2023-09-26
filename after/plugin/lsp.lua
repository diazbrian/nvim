local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	'lua_ls',
	'clangd',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-l>'] = cmp.mapping.confirm({ select = true }),
	['<C-e>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons ={
		error = ' ●', -- '',
		warn = ' ●', --'',
		hint = ' ●', --'',
		info = ' ●' --''
	}
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "<C-j>", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "<C-k>", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-y>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})

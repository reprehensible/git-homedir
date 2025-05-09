local lsp = require('lsp-zero')
local util = require('lspconfig.util')

lsp.preset('recommended')
lsp.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {'tsserver', 'eslint', 'rust_analyzer'},
	handlers = {
		lsp.default_setup,
	},
})
-- doesn't actually work
require('lspconfig').tsserver.setup({
	init_options = {
		typescript = {
			preferences = {
				importModuleSpecifier = "relative" 
			},
		},
	},
})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm(cmp_select),
		['<C-Space>'] = cmp.mapping.complete(),

	})
})

require('lspconfig').eslint.setup({
  root_dir = require('lspconfig.util').find_git_ancestor or vim.loop.os_homedir,
  settings = {
	workingDirectory = { mode = 'auto' }
  }
})

lsp.on_attach(function(client, bufnr)
  if client.name == "eslint" then
	client.server_capabilities.documentFormattingProvider = true
  elseif client.name == "tsserver" then
	client.server_capabilities.documentFormattingProvider = false
  end
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

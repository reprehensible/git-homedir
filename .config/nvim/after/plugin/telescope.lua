local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>tj', builtin.jumplist, {})
vim.keymap.set('n', '<leader>tw', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<leader>tr', builtin.lsp_references, {})

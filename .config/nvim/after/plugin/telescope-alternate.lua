require('telescope-alternate').setup({
    mappings = {
	    { 'src(.*)/(.*).ts', {
		    { 'src/[1]/[2].spec.ts', 'Test' }
	    } },
	    { 'src(.*)/(.*).(spec.)ts', {
		    { 'src/[1]/[2].ts', 'Subject' }
	    } },
    },
})

require('telescope').load_extension('telescope-alternate')
local telescope = require('telescope')

vim.keymap.set("n", "<leader>r", telescope.extensions['telescope-alternate'].alternate_file)

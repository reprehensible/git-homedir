require('lualine').setup({
	options = {
		icons_enabled = false
	},
	sections = {
		lualine_c = {
			{'filename', path = 1}
		}
	},
})

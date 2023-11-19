local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.termguicolors = true

require("lazy").setup({
	{'nvim-telescope/telescope.nvim', tag = '0.1.3',
	dependencies = { 'nvim-lua/plenary.nvim' }
        },
	{ 'rose-pine/neovim', name = 'rose-pine' },
	{ 'nvim-treesitter/nvim-treesitter' },
	{ 'ThePrimeagen/harpoon' },
	{ 'tpope/vim-fugitive' },
	{ 'tpope/vim-rhubarb' },
	--- Uncomment these if you want to manage LSP servers from neovim
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},

	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	{'nvim-lualine/lualine.nvim'},
	{'sainnhe/everforest'},
	{'catppuccin/nvim', name = "catppuccin", priority = 1000 },
	{'edeneast/nightfox.nvim'},
	{'kyazdani42/nvim-web-devicons'},
	{'freddiehaddad/feline.nvim'},
	{ "otavioschwanck/telescope-alternate" },
	{ 'lewis6991/gitsigns.nvim' },
	{'ldelossa/litee.nvim' },
	{'ldelossa/gh.nvim'},
})

require("remap")

vim.g.everforest_background = 'soft'

require('rose-pine').setup({
	disable_italics = true,
})

vim.g.netrw_banner = 0

vim.cmd.colorscheme('rose-pine')
vim.cmd.colorscheme('terafox')

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = e


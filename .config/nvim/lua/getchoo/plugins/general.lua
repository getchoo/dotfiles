--
-- configuration for general plugins
--

---- autopairs
require("nvim-autopairs").setup({
	disable_filetype = { "TeleScopePrompt" },
})

---- catppuccin
local compile_path = vim.fn.stdpath("cache") .. "/catppuccin-nvim"
vim.fn.mkdir(compile_path, "p")
vim.opt.runtimepath:append(compile_path)

require("catppuccin").setup({
	compile_path = compile_path,
	flavour = "mocha", -- mocha, macchiato, frappe, latte
	integrations = {
		barbar = true,
		cmp = true,
		gitsigns = true,
		leap = true,
		native_lsp = {
			enabled = true,
		},
		nvimtree = true,
		treesitter_context = true,
		treesitter = true,
		telescope = true,
		lsp_trouble = true,
	},
	no_italic = true,
})
vim.api.nvim_command("colorscheme catppuccin")

---- bufferline
require("bufferline").setup({
	options = {
		highlights = require("catppuccin.groups.integrations.bufferline").get(),
		diagnostics = "nvim_lsp",
		numbers = "ordinal",
	},
})

---- leap
require("leap").add_default_mappings()

---- lualine
require("lualine").setup({
	options = {
		theme = "catppuccin",
	},
	extensions = { "nvim-tree" },
})

---- nvim-tree
require("nvim-tree").setup()

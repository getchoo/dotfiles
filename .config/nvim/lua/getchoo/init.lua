--
-- setup plugins
--

require("getchoo.plugins")

local M = {}

M.bufferline = {
	animation = true,
	auto_hide = true,
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	icons = true,
	maximum_padding = 2,
	semantic_letters = true,
}

local compile_path = vim.fn.stdpath("cache") .. "/catppuccin-nvim"
vim.fn.mkdir(compile_path, "p")
vim.opt.runtimepath:append(compile_path)

M.catppuccin = {
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
}

M.lualine = {
	options = {
		theme = "catppuccin",
	},
	extensions = { "nvim-tree" },
}

M.tree = {}

require("catppuccin").setup(M.catppuccin)
vim.api.nvim_command("colorscheme catppuccin")
require("bufferline").setup(M.bufferline)
require("leap").add_default_mappings()
require("lualine").setup(M.lualine)
require("nvim-tree").setup(M.tree)

if vim.g.use_lsp_plugins then
	require("getchoo.ftdetect")
	require("getchoo.lsp")
end

require("getchoo.keymap")

return M

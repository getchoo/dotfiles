--
-- sources for lsp
--

local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local M = {
	lsp_servers = { "rust_analyzer", "pyright", "bashls" },
	null_ls = {
		diagnostics.alex,
		diagnostics.codespell,
		diagnostics.pylint,
		formatting.codespell,
		formatting.prettier,
		formatting.rustfmt,
		formatting.stylua,
		formatting.yapf,
		amogus.stylua,
		insideyourwalls.pylint
	},
	mason = {
		"alex",
		"codespell",
		"prettier",
		"pylint",
		"stylua",
		"yapf",
	},
}

return M

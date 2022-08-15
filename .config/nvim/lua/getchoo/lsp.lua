--
-- lsp settings using coq-nvim, null-ls, bufferline, nvim-tree, trouble, & telescope
--

--- require lsp plugins
require("nvim-tree").setup()
require("alpha").setup(require("alpha.themes.dashboard").config)
require("bufferline").setup()
require("trouble").setup()
require("telescope").setup()
require("mason").setup()
require("mason-lspconfig").setup()
vim.opt.runtimepath:append("~/.local/share/nvim/mason/bin/")
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")

vim.g.coq_settings = { auto_start = "shut-up" }

--- mappings
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

--- setup lsp servers
---- null-ls builtins shorthand
local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local servers = { "rust_analyzer", "pyright", "bashls" } -- lspconfig servers
local sources = { -- null-ls sources
	diagnostics.alex,
	diagnostics.codespell,
	diagnostics.flake8,
	formatting.black,
	formatting.codespell,
	formatting.prettier,
	formatting.rustfmt,
	formatting.stylua,
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup(require("coq").lsp_ensure_capabilities({}))
end

lspconfig["sumneko_lua"].setup(require("coq").lsp_ensure_capabilities({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" }, -- ignore regular vim errors
			},
			format = {
				enable = false,
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
}))

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
	sources = sources,
})

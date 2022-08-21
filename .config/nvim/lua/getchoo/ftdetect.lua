--
-- load custom file types
--

vim.g.do_filetype_lua = 1 -- enable filetype.lua
vim.g.did_load_filetypes = 0

local filetypes = {
	filename = {
		PKGBUILD = "text",
	},
}

vim.filetype.add(filetypes)

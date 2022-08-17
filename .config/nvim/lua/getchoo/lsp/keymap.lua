--
-- keymaps for lsp
--

local opts = { noremap = true, silent = true }
local set = function(mode, key, cmd)
	vim.keymap.set(mode, key, cmd, opts)
end

set("n", "<space>e", vim.diagnostic.open_float)
set("n", "[d", vim.diagnostic.goto_prev)
set("n", "]d", vim.diagnostic.goto_next)
set("n", "<space>q", vim.diagnostic.setloclist)

set("n", "<space>f", function()
	vim.cmd([[:Clap]])
end)

set("n", "<leader>t", function()
	vim.cmd([[:NvimTreeToggle]])
end)

set("n", "<space>t", function()
	vim.cmd([[:TroubleToggle]])
end)

local bufferline = require("bufferline")
for i = 1, 9 do
	set("n", "<leader>" .. i, function()
		bufferline.go_to_buffer(i, true)
	end)
end

set("n", "<leader>p", function()
	bufferline.pick_buffer()
end)

set("n", "<leader>q", function()
	bufferline.close_buffer_with_pick()
end)

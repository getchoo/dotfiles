--
-- keymaps
--

vim.g.mapleader = ","

local opts = { noremap = true, silent = true }
local set = function(mode, key, cmd)
	vim.keymap.set(mode, key, cmd, opts)
end

set("n", "<leader>t", function()
	vim.cmd("NvimTreeToggle")
end)

for i = 1, 9 do
  set("n", "<leader>" .. i, function()
    local vimcmd = "BufferLineGoToBuffer " .. i
    vim.cmd(vimcmd)
  end)
end

set("n", "<leader>q", function()
  vim.cmd("BufferLinePickClose")
end)

if vim.g.use_lsp_plugins then
	-- lsp
	set("n", "<space>e", vim.diagnostic.open_float)
	set("n", "[d", vim.diagnostic.goto_prev)
	set("n", "]d", vim.diagnostic.goto_next)
	set("n", "<space>q", vim.diagnostic.setloclist)

	set("n", "<space>f", function()
		vim.cmd("Telescope")
	end)

	set("n", "<space>t", function()
		vim.cmd("TroubleToggle")
	end)
end

--
-- getchoo's neovim config (but in lua :p)
--

local cmd = vim.cmd
local opt = vim.opt

vim.g.use_lsp_plugins = true
vim.g.use_mason = false

require("getchoo.plugins")
if vim.g.use_lsp_plugins then
  require("getchoo.ftdetect")
  require("getchoo.lsp")
end

-- text options
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- appearance
opt.syntax = "on"
cmd("colorscheme nord")
opt.termguicolors = true

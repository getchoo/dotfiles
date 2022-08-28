--
-- getchoo's neovim config (but in lua :p)
--

local cmd = vim.cmd
local opt = vim.opt

require("getchoo.ftdetect")
require("getchoo.plugins")
require("getchoo.lsp")

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
opt.relativenumber = true

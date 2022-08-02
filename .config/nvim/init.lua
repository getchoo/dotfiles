--
-- getchoo's neovim config (but in lua :p)
--

local fn = vim.fn
local cmd = vim.cmd
local opt = vim.opt

require('getchoo.plugins')
require('getchoo.lsp')

-- options
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.termguicolors = true

-- apperance
cmd[[syntax on]]
cmd[[filetype plugin indent on]]
cmd[[colorscheme nord]]

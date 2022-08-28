-- wrapper for all configs
local cmp = require("getchoo.lsp.config.cmp")
local lsp_config = require("getchoo.lsp.config.lsp_config")
local mason = require("getchoo.lsp.config.mason")
local null_ls = require("getchoo.lsp.config.null_ls")

local M = {}

M.bufferline = {
  animation = true,
  auto_hide = true,
  icons = true,
  maximum_padding = 2,
  semantic_letters = true,
}

local db = require("dashboard")
db.custom_center = {
  {
    desc = "find a file",
    action = "Telescope fd",
  },
  {
    desc = "update plugins",
    action = "PackerSync",
  },
  {
    desc = "update treesitter parsers",
    actions = "TSUpdate",
  },
}

db.custom_header = {
  " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
  " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
  " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
  " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
  " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
  " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
}

M.cmp = cmp.config

M.lsp_servers = lsp_config.servers

M.mason_tool_installer = mason.mason_tool_installer
M.mason_lspconfig = mason.mason_lspconfig

M.null_ls = null_ls.config

M.tree = {}

M.treesitter = {
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

M.trouble = {}

return M

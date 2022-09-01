--
-- config for regular plugins
--

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

M.lualine = {
  options = {
    theme = "nord",
  },
  extensions = { "nvim-tree" },
}

M.tree = {}

require("getchoo.keymap")
return M

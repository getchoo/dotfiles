--
-- setup lsp environment
--
require("getchoo.lsp.server")
require("getchoo.lsp.keymap")
local config = require("getchoo.lsp.config")

require("bufferline").setup(config.bufferline)
require("gitsigns").setup()
require("nvim-tree").setup(config.tree)
require("nvim-treesitter.configs").setup(config.treesitter)
require("trouble").setup(config.trouble)

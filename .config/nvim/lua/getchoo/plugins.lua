--
-- plugins for neovim
--

local fn = vim.fn
local cmd = vim.cmd

local packer_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(packer_path)) > 0 then
  Packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_path,
  })
  cmd("packadd packer.nvim")
end

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- comsetic plugins
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

  use("shaunsingh/nord.nvim")

  use({ "rose-pine/neovim", as = "rose-pine" })

  use("glepnir/dashboard-nvim")

  -- lsp plugins
  use("neovim/nvim-lspconfig")

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig")
  use("whoissethdaniel/mason-tool-installer.nvim")

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/vim-vsnip")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")

  use("kyazdani42/nvim-tree.lua")

  use({
    "romgrk/barbar.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })

  use({
    "folke/trouble.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })
  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use("lewis6991/gitsigns.nvim")
  use("rcarriga/nvim-notify")

  if Packer_bootstrap then
    require("packer").sync()
  end
end)

-- setup nord colorscheme
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_italic = false
require("nord").set()

require("lualine").setup({
  options = {
    theme = "nord",
  },
  extensions = { "nvim-tree" },
})

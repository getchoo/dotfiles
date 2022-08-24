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
  cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- comsetic plugins
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

  use("arcticicestudio/nord-vim")

  use({ "rose-pine/neovim", as = "rose-pine" })

  use({
    "goolord/alpha-nvim",
    config = function()
      require("alpha").setup(require("alpha.themes.dashboard").config)
    end,
  })

  -- lsp plugins
  use("neovim/nvim-lspconfig")

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig")
  use("WhoIsSethDaniel/mason-tool-installer.nvim")

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/vim-vsnip")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")

  use("kyazdani42/nvim-tree.lua")

  use({
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = { "kyazdani42/nvim-web-devicons" },
  })

  use({
    "folke/trouble.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })

  use({
    "liuchengxu/vim-clap",
    run = function()
      vim.cmd([[:Clap install-binary!]])
    end,
  })

  if Packer_bootstrap then
    require("packer").sync()
  end
end)

require("lualine").setup({
  options = {
    theme = "nord",
  },
  extensions = { "nvim-tree" },
})

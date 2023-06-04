--
-- plugin init for neovim
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
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })

	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})

	-- general use plugins
	use({
		"akinsho/bufferline.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	use("ggandor/leap.nvim")
	use("kyazdani42/nvim-tree.lua")
	use("windwp/nvim-autopairs")

	-- lsp plugins
	if vim.g.use_lsp_plugins then
		use("neovim/nvim-lspconfig")

		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		})

		if vim.g.use_mason then
			use("williamboman/mason.nvim")
			use("williamboman/mason-lspconfig")
			use("whoissethdaniel/mason-tool-installer.nvim")
		end

		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				require("nvim-treesitter.install").update({ with_sync = true })
			end,
		})
		use("IndianBoy42/tree-sitter-just")

		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/vim-vsnip")
		use("L3MON4D3/LuaSnip")
		use("saadparwaiz1/cmp_luasnip")

		use({
			"folke/trouble.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
		})
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		})

		use("lewis6991/gitsigns.nvim")
		use("j-hui/fidget.nvim")
	end

	if Packer_bootstrap then
		require("packer").sync()
	end
end)

require("getchoo.plugins.general")

if vim.g.use_lsp_plugins then
	require("getchoo.plugins.lsp")
end

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
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use("kyazdani42/nvim-tree.lua")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig")
	use("neovim/nvim-lspconfig")
	use({ "ms-jpq/coq_nvim", run = "python3 -m coq deps" })
	use("ms-jpq/coq.artifacts")
	use("ms-jpq/coq.thirdparty")
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"folke/trouble.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
	use("arcticicestudio/nord-vim")
	use({ "rose-pine/neovim", as = "rose-pine" })

	if Packer_bootstrap then
		require("packer").sync()
	end
end)

require("nvim-treesitter.configs").setup({
	auto_install = true,
})

require("lualine").setup({
	options = {
		theme = "nord",
	},
	extensions = { "nvim-tree" },
})

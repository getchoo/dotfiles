--
-- plugins for neovim
--

local fn = vim.fn
local cmd = vim.cmd
local opt = vim.opt


local packer_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(packer_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth', '1',
    'https://github.com/wbthomason/packer.nvim',
    packer_path
  })
  cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'neovim/nvim-lspconfig'
  use { 'ms-jpq/coq_nvim', run = 'python3 -m coq deps' }
  use 'ms-jpq/coq.artifacts'
  use 'ms-jpq/coq.thirdparty'
  use 'mfussenegger/nvim-lint'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'arcticicestudio/nord-vim'
  use {'rose-pine/neovim', as = 'rose-pine'}

  if packer_bootstrap then
    require('packer').sync()
  end
end)

require('nvim-treesitter.configs').setup {
  auto_install = true
}

require('lualine').setup {
  options = {
    theme = 'nord'
  },
  extensions = {'nvim-tree'}
}

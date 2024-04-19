local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { 'folke/tokyonight.nvim' },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "Mofiqul/dracula.nvim" },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  "nvim-treesitter/playground",
  "mbbill/undotree",
  "tpope/vim-fugitive",
  "github/copilot.vim",
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup {}
    end
  },
  "natecraddock/workspaces.nvim",
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
  },
  { 'neovim/nvim-lspconfig', dependencies = { { 'hrsh7th/cmp-nvim-lsp' } } },
  -- Autocompletion
  { 'hrsh7th/nvim-cmp', dependencies = { { 'L3MON4D3/LuaSnip' } } },
  { "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter"
  } },
})

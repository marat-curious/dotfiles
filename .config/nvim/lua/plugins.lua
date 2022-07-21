require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "neovim/nvim-lspconfig"
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "catppuccin/nvim", as = "catppuccin" }
end)

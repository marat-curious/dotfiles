local use = require("packer").use

require("packer").startup(function()
  use "wbthomason/packer.nvim"
  use "neovim/nvim-lspconfig"
end)

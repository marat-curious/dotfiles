-- disable builtin plugins
local builtin_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logiPat",
  "matchit",
  "matchparen",
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "rrhelper",
  "spellfile_plugin",
  "tar",
  "tarPlugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin"
}

for _, plugin in pairs(builtin_plugins) do
  vim.g["loaded_" .. plugin] = 1
end

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "neovim/nvim-lspconfig"
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
end)

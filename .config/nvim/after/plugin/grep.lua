local set = vim.o

if vim.fn.executable("rg") == 1 then
  set.grepprg = "rg --vimgrep --no-heading"
  set.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

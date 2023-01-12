local vim = vim 

local M = {}

function M.color()

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
--vim.cmd([[colorscheme kanagawa]])

vim.opt.termguicolors = true

end
return M

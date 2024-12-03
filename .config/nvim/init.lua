
-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

require('settings')
require('plugins')
require('remap')
require('lsp')
require('tree')

vim.lsp.set_log_level("off")

--colorscheme  = catppuccin
vim.cmd.colorscheme "catppuccin-frappe"

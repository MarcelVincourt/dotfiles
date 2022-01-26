
-- local to buffer
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 0

-- local to window
vim.wo.number = true
vim.wo.colorcolumn = '120'


-- global options
vim.o.termguicolors = true
vim.o.cmdheight = 2
vim.o.scrolloff = 999

-- set colorscheme
vim.cmd('colorscheme gruvbox')

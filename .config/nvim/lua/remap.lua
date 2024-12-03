vim.g.mapleader = " "

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

vim.keymap.set("i", "<C-j>", "<Esc>")


local opts = {noremap = true}
vim.keymap.set('n', '<C-j>', '<C-W>j', opts)
vim.keymap.set('n', '<C-k>', '<C-W>k', opts)
vim.keymap.set('n', '<C-h>', '<C-W>h', opts)
vim.keymap.set('n', '<C-l>', '<C-W>l', opts)

vim.keymap.set('n', '<C-Up>', '<C-W>-', opts)
vim.keymap.set('n', '<C-Down>', '<C-W>+', opts)
-- undo tap
vim.keymap.set('n', '<C-Right>', ':vertical resize +5<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -5<CR>', opts)
vim.keymap.set('n', '*', '*N', opts)
vim.keymap.set('n', '#', '#N', opts)

-- toggle nvimtree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

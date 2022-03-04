
-- key remaps
local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true}
keymap('n', '<C-j>', '<C-W>j', opts)
keymap('n', '<C-k>', '<C-W>k', opts)
keymap('n', '<C-h>', '<C-W>h', opts)
keymap('n', '<C-l>', '<C-W>l', opts)
-- undo tap
keymap('n', '<C-Right>', ':vertical resize +5<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -5<CR>', opts)

keymap('n', '*', '*N', opts)
keymap('n', '#', '#N', opts)


local function nkeymap(key, map)
    keymap('n', key, map, opts)
end


-- Goto
nkeymap('<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')

-- Diagnostic
nkeymap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
nkeymap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
nkeymap('<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
nkeymap('<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')


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

-- action
nkeymap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
nkeymap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
nkeymap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
nkeymap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
nkeymap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
nkeymap('<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
nkeymap('<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
nkeymap('<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
nkeymap('<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
nkeymap('<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
nkeymap('<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
nkeymap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
nkeymap('<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
nkeymap('<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

-- Goto
nkeymap('<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')

-- Diagnostic
nkeymap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
nkeymap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')

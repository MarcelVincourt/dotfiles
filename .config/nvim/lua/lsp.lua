local lsp = require('lsp-zero')

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

lsp.preset("remocommended")



lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<space>D', function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set('n', '<space>wa', function() vim.lsp.buf.add_workspace_folder() end, opts)
  vim.keymap.set('n', '<space>wr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
  vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
	'tsserver',
	'pyright'
  },
  handlers = {
    lsp.default_setup,
  },
})


--require('lspconfig').pyright.setup({
--	on_attach = on_attach
--})

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'path'},
    {name = 'buffer'}
  },
  mapping = {
    -- start showing or stop showing
    ['<C-Space>'] = cmp.mapping(function()
        if cmp.visible() then
            cmp.abort()
        else
            cmp.complete()
        end
    end),


    ['<CR>'] = cmp.mapping.confirm({select = false}),


    --['<C-y>'] = cmp.mapping.confirm({select = false}),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-k>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
    ['<C-j>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

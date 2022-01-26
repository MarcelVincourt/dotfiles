require('keybindings')
require('packages')
require('config')


local cmp = require'cmp'

cmp.setup({
    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.mapping(
            cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        --['<Tab>'] = function(fallback)
        --    if cmp.visible then
        --        cmp.select_next_item()
        --    else
        --        fallback()
        --    end
        --end,
        --['<S-Tab>'] = function(fallback)
        --    if cmp.visible then
        --        cmp.select_prev_item()
        --    else
        --        fallback()
        --    end
        --end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvmim_lua' },
        { name = 'path' },
        { name = 'buffer' },
    }),

    formatting = {
        format = function(entry, vim_item)
        vim_item.menu = ({
            nvim_lsp = "[LSP]",
            path = "[PATH]",
            buffer = "[Buffer]",
        })[entry.source.name]
        return vim_item
        end
    },
})

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})
    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    },
    {
        { name = 'cmdline' }
    })
})

    -- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').pyright.setup{
    capabilities = capabilities
}

require('lspconfig').sumneko_lua.setup{
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim', 'use'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false
            },
        },
    },
}

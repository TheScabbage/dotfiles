vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)           -- show docs
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- rename

        vim.keymap.set('n', 'pt', vim.lsp.buf.format, opts)         -- pretty
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)     -- go definition
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts) -- go implementation

        vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_next, opts)         -- error next
        vim.keymap.set('n', '<leader>ep', vim.diagnostic.goto_prev, opts)         -- error prev
        vim.keymap.set('n', '<leader>ed', "<cmd>Telescope diagnostics<cr>", opts) -- error diagnostics
    end
})

require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "arduino_language_server",
        "gopls",
        "zls",
    }
}

local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspcfg = require("lspconfig")

lspcfg.rust_analyzer.setup { capabilities = capabilities }
lspcfg.zls.setup { capabilities = capabilities }
lspcfg.gopls.setup { capabilities = capabilities }
lspcfg.lua_ls.setup { capabilities = capabilities }

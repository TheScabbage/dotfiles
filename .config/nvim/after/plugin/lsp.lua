vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(ev)
	  local opts = { buffer = ev.buf }
	  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

	  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', '<leader>dl', "<cmd>Telescope diagnostics<cr>", opts)
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


lspcfg = require("lspconfig")

lspcfg.rust_analyzer.setup {}
lspcfg.zls.setup {}
lspcfg.gopls.setup {}


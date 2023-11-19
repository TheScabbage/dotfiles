vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(ev)
	  local opts = { buffer = ev.buf }
	  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  end
})

require('mason').setup()
require('mason-lspconfig').setup {
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"csharp_ls",
		"arduino_language_server",
		"gopls",
		"zls",
	}
}


lspcfg = require("lspconfig")

lspcfg.rust_analyzer.setup {}
lspcfg.zls.setup {}
lspcfg.gopls.setup {}



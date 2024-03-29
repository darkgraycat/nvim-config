local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')
local lspsaga = require('lspsaga')
local null_ls = require('null-ls')

local inlay_hints = require('inlay-hints')
inlay_hints.setup({ renderer = 'inlay-hints/render/eol' })

local on_attach = function(client, bufnr)
  print('Inlay hints attached ')
  inlay_hints.on_attach(client, bufnr)
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local lsps = { 'rust_analyzer', 'tsserver', 'html', 'cssls', 'eslint', 'lua_ls', 'jsonls' }

mason.setup()
mason_lspconfig.setup({ ensure_installed = lsps })

print('LPS start')
for _, lsp in ipairs(lsps) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

lspsaga.setup()
null_ls.setup()

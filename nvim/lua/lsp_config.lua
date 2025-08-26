--local lspconfig_defaults = require('lspconfig').util.default_config
--lspconfig_defaults.capabilities =
--  vim.tbl_deep_extend('force', lspconfig_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())

-- Features that only work if a language server is active
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  end,
})

local capabilities = require('blink.cmp').get_lsp_capabilities()

require('lspconfig').vimls.setup({ capabilities = capabilities })
require('lspconfig').tailwindcss.setup({ capabilities = capabilities })
require('lspconfig').lua_ls.setup({ capabilities = capabilities })
-- vscode-langservers-extracted
require('lspconfig').eslint.setup({ capabilities = capabilities })
require('lspconfig').volar.setup({ capabilities = capabilities })
require('lspconfig').ts_ls.setup({
  capabilities = capabilities,
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = '/Users/jonathangrangien/.nvm/versions/node/v20.18.0/lib/node_modules/@vue/typescript-plugin',
        languages = { 'javascript', 'typescript', 'vue' },
      },
    },
  },
  filetypes = {
    'javascript',
    'javascript.jsx',
    'javascriptreact',
    'typescript',
    'typescript.tsx',
    'typescriptreact',
    'vue',
  },
})
require('lspconfig').csharp_ls.setup({ capabilities = capabilities })

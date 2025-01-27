require('lspconfig').vimls.setup({})
require('lspconfig').tailwindcss.setup({})
require('lspconfig').lua_ls.setup({})
-- vscode-langservers-extracted
require 'lspconfig'.eslint.setup {}
require('lspconfig').volar.setup({})
require('lspconfig').ts_ls.setup({
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
require('lspconfig').csharp_ls.setup({})

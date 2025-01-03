--  ___      ___ ___  _____ ______
-- |\  \    /  /|\  \|\   _ \  _   \
-- \ \  \  /  / | \  \ \  \\\__\ \  \
--  \ \  \/  / / \ \  \ \  \\|__| \  \
--   \ \    / /   \ \  \ \  \    \ \  \
--    \ \__/ /     \ \__\ \__\    \ \__\
--     \|__|/       \|__|\|__|     \|__|
--
--

require('main_settings')
require('plugin_variables')
require('main_keymaps')
require('plugin_keymaps')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Auto-install lazy.nvim if not present
if not vim.uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  { 'scrooloose/nerdtree', event = 'VeryLazy' },
  { 'Xuyuanp/nerdtree-git-plugin', event = 'VeryLazy' },
  'vim-airline/vim-airline',
  'vim-airline/vim-airline-themes',
  { 'airblade/vim-gitgutter', event = 'VeryLazy' },
  'airblade/vim-rooter',
  { 'szw/vim-ctrlspace', event = 'VeryLazy' },
  { 'tpope/vim-fugitive', event = 'VeryLazy' },
  { 'tmsvg/pear-tree', event = 'VeryLazy' },
  { 'junegunn/fzf', dir = '~/.fzf', build = './install --all', event = 'VeryLazy' },
  { 'junegunn/fzf.vim', event = 'VeryLazy' },
  'jeetsukumaran/vim-buffergator',
  { 'NLKNguyen/papercolor-theme', lazy = false, priority = 1000 },
  { 'folke/tokyonight.nvim', lazy = false, priority = 1000 },
  {
    'gruvbox-community/gruvbox',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark'
      vim.g['gruvbox_italic'] = 1
      -- vim.g["airline_theme='gruvbox'"]
      vim.cmd('colorscheme gruvbox')
    end,
  },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        vue = { 'prettier' },
        graphql = { 'prettier' },
        json = { 'prettier' },
        css = { 'prettier' },
        scss = { 'prettier' },
        lua = { 'stylua' },
      },
      format_on_save = {},
    },
  },
  { 'scrooloose/nerdcommenter', event = 'VeryLazy' },
  { 'ap/vim-css-color', event = 'VeryLazy' },
  { 'severin-lemaignan/vim-minimap', event = 'VeryLazy' },
  { 'jceb/vim-orgmode', event = 'VeryLazy' },
  { 'vim-scripts/utl.vim', event = 'VeryLazy' },
  { 'easymotion/vim-easymotion', event = 'VeryLazy' },
  { 'prettier/prettier', event = 'VeryLazy' },
  { 'mustache/vim-mustache-handlebars', event = 'VeryLazy' },
  { 'ludovicchabant/vim-gutentags', event = 'VeryLazy' },
  { 'gregsexton/MatchTag', event = 'VeryLazy' },
  { 'unblevable/quick-scope', event = 'VeryLazy' },
  { 'posva/vim-vue', event = 'VeryLazy' },
})

require('lsp_config')
require('language_servers')
require('cmp_setup')

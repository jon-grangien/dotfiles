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
  'airblade/vim-rooter',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/nvim-cmp',
  'jeetsukumaran/vim-buffergator',
  'neovim/nvim-lspconfig',
  'vim-airline/vim-airline',
  'vim-airline/vim-airline-themes',
  { 'airblade/vim-gitgutter', event = 'VeryLazy' },
  { 'ap/vim-css-color', event = 'VeryLazy' },
  { 'easymotion/vim-easymotion', event = 'VeryLazy' },
  { 'folke/tokyonight.nvim', lazy = false, priority = 1000 },
  { 'gregsexton/MatchTag', event = 'VeryLazy' },
  { 'jceb/vim-orgmode', event = 'VeryLazy' },
  { 'junegunn/fzf', dir = '~/.fzf', build = './install --all', event = 'VeryLazy' },
  { 'junegunn/fzf.vim', event = 'VeryLazy' },
  { 'mustache/vim-mustache-handlebars', event = 'VeryLazy' },
  { 'NLKNguyen/papercolor-theme', lazy = false, priority = 1000 },
  { 'posva/vim-vue', event = 'VeryLazy' },
  { 'prettier/prettier', event = 'VeryLazy' },
  { 'scrooloose/nerdcommenter', event = 'VeryLazy' },
  { 'severin-lemaignan/vim-minimap', event = 'VeryLazy' },
  { 'szw/vim-ctrlspace', event = 'VeryLazy' },
  { 'tmsvg/pear-tree', event = 'VeryLazy' },
  { 'tpope/vim-fugitive', event = 'VeryLazy' },
  { 'unblevable/quick-scope', event = 'VeryLazy' },
  { 'vim-scripts/utl.vim', event = 'VeryLazy' },
  { 'Xuyuanp/nerdtree-git-plugin', event = 'VeryLazy' },
  {
    'gruvbox-community/gruvbox',
    lazy = false,
    priority = 1001,
    config = function()
      vim.o.background = 'dark'
      vim.g['gruvbox_italic'] = 1
      vim.g['airline_theme='] = 'gruvbox'
      vim.cmd('colorscheme gruvbox')
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
  },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
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
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy', -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup({
        -- Style preset for diagnostic messages
        -- Available options:
        -- "modern", "classic", "minimal", "powerline",
        -- "ghost", "simple", "nonerdfont", "amongus"
        preset = 'modern',
        softwrap = 30,
        multiple_diag_under_cursor = true,

        hi = {
          -- Background color for diagnostics
          -- Can be a highlight group or a hexadecimal color (#RRGGBB)
          background = 'CursorLine',
        },

        options = {
          show_source = false,
        },
      })
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        ensure_installed = {
          'lua',
          'vim',
          'vimdoc',
          'bash',
          'html',
          'javascript',
          'gitignore',
          'scss',
          'typescript',
          'tsx',
          'vue',
        },
        auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
})

require('lsp_config')
require('language_servers')
require('cmp_setup')
require('autocmds')

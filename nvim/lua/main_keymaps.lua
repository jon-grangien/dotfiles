local theme_helpers = require('theme_helpers')

vim.keymap.set('n', ',', ':')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<esc>', ':noh<cr><esc>', { silent = true, noremap = true })

vim.keymap.set('n', '<F1>', ':set wrap!<cr>', { noremap = true })
vim.keymap.set('n', '<F2>', ':set relativenumber!<cr>', { noremap = true })
vim.keymap.set('n', '<F9>', theme_helpers.flip_to_next_colorscheme, { noremap = true })
vim.keymap.set('n', '<leader>q', ':q<cr>', { noremap = true })
vim.keymap.set('n', '<leader>w', ':w<cr>', { noremap = true })
vim.keymap.set('n', '<leader>w', ':w<cr>')
vim.keymap.set('n', '<leader>so', ':so ~/dotfiles/nvim/init.lua<cr>')
vim.keymap.set('n', '<leader>yf', ':let @+=@%<cr>')

vim.keymap.set('n', '<leader>l', function()
  local count = vim.v.count > 0 and vim.v.count or 1
  vim.cmd('vertical resize +' .. (10 * count))
end, { silent = true })
vim.keymap.set('n', '<leader>h', function()
  local count = vim.v.count > 0 and vim.v.count or 1
  vim.cmd('vertical resize -' .. (10 * count))
end, { silent = true })
vim.keymap.set('n', '<leader>j', function()
  local count = vim.v.count > 0 and vim.v.count or 1
  vim.cmd('resize +' .. (5 * count))
end, { silent = true })
vim.keymap.set('n', '<leader>k', function()
  local count = vim.v.count > 0 and vim.v.count or 1
  vim.cmd('resize -' .. (5 * count))
end, { silent = true })

vim.keymap.set('n', '<C-k>', ':wincmd k<cr>')
vim.keymap.set('n', '<C-j>', ':wincmd j<cr>')
vim.keymap.set('n', '<C-h>', ':wincmd h<cr>')
vim.keymap.set('n', '<C-l>', ':wincmd l<cr>')

-- make sessions
vim.keymap.set('n', '<leader>ss1', ':mks! ~/.vimsessions/session1.vim<cr>')
vim.keymap.set('n', '<leader>ss2', ':mks! ~/.vimsessions/session2.vim<cr>')
vim.keymap.set('n', '<leader>ss3', ':mks! ~/.vimsessions/session3.vim<cr>')
vim.keymap.set('n', '<leader>ss4', ':mks! ~/.vimsessions/session4.vim<cr>')
vim.keymap.set('n', '<leader>ss5', ':mks! ~/.vimsessions/session5.vim<cr>')
-- restore sessions
vim.keymap.set('n', '<leader>sr1', ':so ~/.vimsessions/session1.vim<cr>')
vim.keymap.set('n', '<leader>sr2', ':so ~/.vimsessions/session2.vim<cr>')
vim.keymap.set('n', '<leader>sr3', ':so ~/.vimsessions/session3.vim<cr>')
vim.keymap.set('n', '<leader>sr4', ':so ~/.vimsessions/session4.vim<cr>')
vim.keymap.set('n', '<leader>sr5', ':so ~/.vimsessions/session5.vim<cr>')

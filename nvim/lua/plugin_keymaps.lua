vim.keymap.set('n', '<Tab>', ':BuffergatorMruCyclePrev<cr>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':BuffergatorMruCycleNext<cr>', { silent = true })

vim.keymap.set('n', '<leader>s', ':Rg<cr>', { noremap = true })

vim.keymap.set('n', '<C-m>', ':Marks<cr>', { silent = true })

vim.keymap.set('n', '<leader>cd', ':lcd %:p:h<cr>:NERDTreeCWD<cr>:pwd<cr>')
vim.keymap.set('n', '<leader>cr', ':Rooter<cr>')

vim.keymap.set('n', '<leader>gb', ':Git blame<cr>')
vim.keymap.set('n', '<leader>gs', ':Git status<cr>')
vim.keymap.set('n', '<leader>gg', ':Git<cr>')
vim.keymap.set('n', '<leader>gl', ':LazyGit<cr>')

vim.keymap.set('n', '<leader>e', '<Plug>(easymotion-j)')
vim.keymap.set('n', '<leader>i', '<Plug>(easymotion-k)')

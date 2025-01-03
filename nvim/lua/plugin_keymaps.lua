vim.keymap.set('n', '<F3>', ':NERDTreeToggle<cr>', { noremap = true })
vim.keymap.set('n', '<F4>', ':NERDTree<cr>', { noremap = true })
vim.keymap.set('n', '<F6>', ':NERDTreeFind<cr>', { noremap = true })
vim.keymap.set('n', '<F7>', ':NERDTreeVCS<cr>', { noremap = true })

vim.keymap.set('n', '<Tab>', ':BuffergatorMruCyclePrev<cr>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':BuffergatorMruCycleNext<cr>', { silent = true })
vim.keymap.set('n', '<leader>s', ':Rg<cr>', { noremap = true })

vim.keymap.set('n', '<C-p>', ':GFiles --exclude-standard --others --cached<cr>', { silent = true })
vim.keymap.set('n', '<leader>p', ':Buffers<cr>', { silent = true })
vim.keymap.set('n', '<C-f>', ':BLines<cr>', { silent = true })
vim.keymap.set('n', '<C-m>', ':Marks<cr>', { silent = true })

vim.keymap.set('n', '<leader>cd', ':lcd %:p:h<cr>:NERDTreeCWD<cr>:pwd<cr>')
vim.keymap.set('n', '<leader>cr', ':Rooter<cr>')

vim.keymap.set('n', '<leader>e', '<Plug>(easymotion-j)')
vim.keymap.set('n', '<leader>i', '<Plug>(easymotion-k)')

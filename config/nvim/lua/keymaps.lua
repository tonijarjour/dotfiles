local keymap = vim.keymap.set

-- Space leader
vim.g.mapleader = ' '

-- Q functions as q
keymap('n', 'Q', 'q', {noremap=true})

-- Yank to clipboard
keymap('v', '<Leader>y', '"+y<cr>', {})

keymap({'n', 'v'}, '<C-u>', '12k', {})
keymap({'n', 'v'}, '<C-d>', '12j', {})

-- Navigate window
keymap('n', '<Leader>wv', '<C-w>v', {})
keymap('n', '<Leader>wq', '<C-w>q', {})
keymap('n', '<Leader>wl', '<C-w>l', {})
keymap('n', '<Leader>wh', '<C-w>h', {})

-- Navigate buffers
keymap('n', '<Leader>bn', '<cmd>BufferLineCycleNext<cr>', {})
keymap('n', '<Leader>bp', '<cmd>BufferLineCyclePrev<cr>', {})
keymap('n', '<Leader>bs', '<cmd>w<cr>', {})
keymap('n', '<Leader>bk', '<cmd>bd<cr>', {})
keymap('n', '<Leader>bK', '<cmd>bd!<cr>', {})

-- Open file
keymap('n', '<Leader>f.', ':e ', {})
keymap('n', '<Leader>f,', ':e ~/', {})

-- Quit nvim, forcefully
keymap('n', '<Leader>qq', '<cmd>qa<cr>', {})
keymap('n', '<Leader>qQ', '<cmd>qa!<cr>', {})

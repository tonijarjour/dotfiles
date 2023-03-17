local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ' '
keymap('n', 'Q', 'q', {noremap=true})
-- Yank to clipboard
keymap('v', '<Leader>y', '"+y<cr>', {})
-- Navigate buffers
keymap('n', '<Leader>fl', '<cmd>BufferLinePick<cr>', {})
keymap('n', '<Leader>fn', '<cmd>BufferLineCycleNext<cr>', {})
keymap('n', '<Leader>fp', '<cmd>BufferLineCyclePrev<cr>', {})
-- New buffer, open file
keymap('n', '<Leader>en', '<cmd>enew<cr>', {})
keymap('n', '<Leader>e.', ':e ', {})
keymap('n', '<Leader>e,', ':e ~/', {})
-- Save buffer
keymap('n', '<Leader>ew', '<cmd>w<cr>', {})
-- Close buffer, forcefully
keymap('n', '<Leader>el', '<cmd>bd<cr>', {})
keymap('n', '<Leader>eL', '<cmd>bd!<cr>', {})
-- Quit nvim, forcefully
keymap('n', '<Leader>ql', '<cmd>qa<cr>', {})
keymap('n', '<Leader>qL', '<cmd>qa!<cr>', {})
-- Make C-d and C-u more consistent
keymap('n', '<C-d>', '12j', {})
keymap('n', '<C-u>', '12k', {})

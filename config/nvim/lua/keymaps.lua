local keymap = vim.api.nvim_set_keymap
local silent = {noremap=true, silent=true}
vim.g.mapleader = ' '
keymap('n', 'Q', 'q', {noremap=true})
-- Session management
keymap('n', '<Leader>hs', '<cmd>SessionSave<cr>', {})
keymap('n', '<Leader>hl', '<cmd>SessionLoad<cr>', {})
-- Navigate buffers
keymap('n', '<Leader>fl', '<cmd>BufferLinePick<cr>', {})
keymap('n', '<Leader>fn', '<cmd>BufferLineCycleNext<cr>', {})
keymap('n', '<Leader>fp', '<cmd>BufferLineCyclePrev<cr>', {})
-- Save this buffer
keymap('n', '<Leader>fw', '<cmd>w<cr>', {})
keymap('n', '<Leader>fW', '<cmd>wa<cr>', {})
-- Close this buffer
keymap('n', '<Leader>fd', '<cmd>bd<cr>', {})
keymap('n', '<Leader>fD', '<cmd>bd!<cr>', {})
-- Quit nvim
keymap('n', '<Leader>ql', '<cmd>qa<cr>', {})
keymap('n', '<Leader>qL', '<cmd>qa!<cr>', {})

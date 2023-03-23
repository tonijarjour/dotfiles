local keymap = vim.keymap.set
local telescope = require("telescope.builtin")

vim.g.mapleader = ' '

-- Open file
keymap('n', '<Leader>ff', telescope.find_files, {})
keymap('n', '<Leader>fg', telescope.live_grep, {})
keymap('n', '<Leader>fo', telescope.oldfiles, {})

-- Help
keymap('n', '<Leader>hv', telescope.help_tags, {})

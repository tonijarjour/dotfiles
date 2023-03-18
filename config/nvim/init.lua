require('settings')
require('plugins')
require('keymaps')

vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup()
vim.cmd [[colorscheme catppuccin]]

require('lualine').setup()
require('bufferline').setup {
    options = {show_close_icon  = false, show_buffer_close_icons  = false}}

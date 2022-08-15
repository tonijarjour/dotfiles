require('settings')
require('plugins')
require('keymaps')

vim.cmd[[colorscheme tokyonight]]
require('nvim-autopairs').setup()
require('lualine').setup()
require('bufferline').setup {
    options = {show_close_icon  = false, show_buffer_close_icons  = false}}
require('nvim-treesitter.configs').setup {
    ensure_installed = {'rust', 'javascript', 'typescript', 'tsx', 'latex'},
    highlight = {enable = true}}

require('plugins')
require('keymaps')
require('settings')

vim.cmd[[colorscheme tokyonight]]
require('nvim-autopairs').setup()
require('nvim_comment').setup()
require('lualine').setup()
require('telescope').load_extension('fzf')
require("bufferline").setup {
    options = {show_close_icon  = false, show_buffer_close_icons  = false}}
require('nvim-treesitter.configs').setup {
    ensure_installed = {'lua'}, highlight = {enable = true}}
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_header = {[[]], [[]], [[]], [[]], [[NEOVIM]]}
vim.g.dashboard_custom_section =  {
    a = {description  = {' Find Files   '}, command = 'Telescope find_files'},
    c = {description  = {' Search Text  '}, command = 'Telescope live_grep'}}
vim.g.dashboard_custom_footer = {}

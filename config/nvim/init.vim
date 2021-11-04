" Line numbers
set number
set relativenumber

" Lightline already indicates insert mode
set noshowmode

" Tabs and Indents will be spaces
set expandtab

" <Tab> places 4 spaces
set tabstop=4

" Indent places 4 spaces
set shiftwidth=4

" Allows you to open another buffer without saving the current
set hidden

" When wrapping long lines, do not break words
set linebreak

" View scrolls at 2 lines from the edges
set scrolloff=2

" Searching with lowercase characters will include uppercase results
set ignorecase

" Searching with uppercase characters will match explicitly
set smartcase

" View will not draw during macros (for better performance)
set lazyredraw

" Key for quick commands
let mapleader = ","

" Quick save
nmap <leader>w :w<cr>

" Clear search highlights
nmap <silent> <leader>/ :noh<cr>

" Open an empty buffer
nmap <silent> <leader>e :enew<cr>

" Go to next buffer
nmap <silent> <leader>n :bn<cr>

" Go to previous buffer
nmap <silent> <leader>p :bp<cr>

" Quit the current buffer
nmap <silent> <leader>d :bd<cr>

" Force quit the current buffer
nmap <silent> <leader>D :bd!<cr>

" Yank to clipboard
vmap <leader>y "+y

" vim-plug
call plug#begin(stdpath('data') . '/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
call plug#end()

" Colorscheme to dracula
let g:dracula_colorterm = 0
let g:lightline = { 'colorscheme': 'dracula' }
colorscheme dracula

" Completely hide the window border
highlight VertSplit cterm=NONE
set fillchars+=vert:\ 

" Disable startify header and new buffer/quit button display
let g:startify_custom_header = 0
let g:startify_enable_special = 0

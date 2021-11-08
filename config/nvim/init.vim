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

" Ignore case in tab completion
set wildignorecase 

" In tab completion, don't pick the first of multiple options
set wildmode=longest:full

" Disable Ex mode from Q (annoying)
map Q q

" vim-plug
call plug#begin(stdpath('data') . '/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'mcchrish/nnn.vim'
call plug#end()

" Key maps for quick actions
let mapleader = " "

" Yank to clipboard (xclip)
vmap <leader>y "+y

" Open a file or empty buffer
nmap <leader>f :e ~/
nmap <silent> <leader>e :enew<cr>

" Remove search highlights
nmap <silent> <leader>/ :noh<cr>

" Save this or all buffers
nmap <silent><leader>w :w<cr>
nmap <silent><leader>W :wa<cr>

" Move between buffers
nmap <silent> <leader>n :bn<cr>
nmap <silent> <leader>p :bp<cr>

" Close this buffer, forcefully
nmap <silent> <leader>d :bd<cr>
nmap <silent> <leader>D :bd!<cr>

" Quit vim
nmap <silent> <leader>Q :qa<cr>

" Session management (startify)
nmap <leader>sl :SLoad 
nmap <leader>ss :SSave!<cr>
nmap <leader>sd :SDelete!<cr>
nmap <leader>sc :SClose<cr>

" nnn file picker (nnn)
let g:nnn#set_default_mappings = 0
nmap <silent> <leader>E :NnnPicker<CR>

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

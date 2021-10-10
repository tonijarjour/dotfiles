" Calmer line number colors
highlight LineNr ctermfg=darkgrey
highlight CursorLineNr ctermfg=grey

" Calmer search result colors
highlight Search ctermfg=darkgrey ctermbg=lightgrey

" Calmer bracket match colors
highlight MatchParen ctermfg=white ctermbg=black

" Line numbers
set number
set relativenumber

" Lightline already indicates insert mode
set noshowmode

" Tabs and Indents will be spaces
set expandtab

" <Tab> places 2 spaces
set tabstop=2

" Indent places 2 spaces
set shiftwidth=2

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

" Copy visual selection to clipboard
vmap <silent> <leader>c :w !xclip -se c<cr><cr>

" Clear search highlights
nmap <silent> <leader>/ :noh<cr>

" Open nnn file manager (nnn)
nmap <silent> <leader>n :NnnPicker<cr>

" Open an empty buffer
nmap <silent> <leader>e :enew<cr>

" Quit the current buffer
nmap <silent> <leader>q :bd<cr>

" Force quit the current buffer
nmap <silent> <leader>Q :bd!<cr>

" Search all open buffers and choose one to open (fzf)
nmap <silent> <leader>g :Buffers<cr>

" Search for files to open (fzf)
nmap <leader>f :Files 

" Pattern search file contents, and open the files you want (ripgrep, fzf)
nmap <leader>r :Rg 

" Search through lines of every open buffer and go to that line (fzf)
nmap <leader>s :Lines 

" Search through lines of the current buffer and go to that line (fzf)
nmap <leader>l :BLines 

" File history. Append : for command history, / for search history (fzf)
nmap <leader>h :History

" Search through marks and go to that line (fzf)
nmap <silent> <leader>k :Marks<cr>

" Search open windows by filename and go to a window (fzf) 
nmap <silent> <leader>d :Windows<cr>

" List key mappings and choose one to run (fzf)
nmap <silent> <leader>m :Maps<cr>

" Search every possible command and choose one to run (fzf)
nmap <silent> <leader>v :Commands<cr>

" Search through nvim documentation entries normally found in :help (fzf)
nmap <silent> <leader>p :Helptags<cr>

" vim-plug
call plug#begin(stdpath('data') . '/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf.vim'
Plug 'mcchrish/nnn.vim'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
call plug#end()

" Colorscheme to dracula
colorscheme dracula

" Lighline colorscheme
let g:lightline = { 'colorscheme': 'darcula' }

" Completely hide the window border
highlight VertSplit cterm=NONE
set fillchars+=vert:\ 

" Disable startify header and new buffer/quit button display
let g:startify_custom_header = 0
let g:startify_enable_special = 0

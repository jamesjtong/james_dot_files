execute pathogen#infect()
Helptags
syntax on
filetype plugin indent on

"SETTINGS

set nocompatible
set hlsearch "highlight search
set number "show line number on left

"set tab width and they become 2 spaces
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
"show command last entered
"set showcmd

set cursorline "highlight current line
set wildmenu "show matching autocomplete commands in command mode
set showmatch "show matching parenthesis/braces
set nowrap "dont wrap lines
set backspace=indent,eol,start    " backspace through everything in insert mode

set laststatus=2 "show status line"
"status line options
set statusline=%f\ %m\ %r
set statusline+=Line:%l/%L[%p%%]
set statusline+=Col:%v
set statusline+=Buf:#%n

"core usage
inoremap jk <esc>
let mapleader = ","

nnoremap <leader>n :NERDTreeToggle<ENTER>
nnoremap <leader>ev :vsplit $MYVIMRC<ENTER>
nnoremap <leader>sv :source $MYVIMRC<ENTER>

"PLUGIN SETTINGS
"================================================================================
"Ag
nnoremap <D-F> :Ag<Space>
nnoremap <leader><D-F> :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

"Commentary
noremap <D-/> :Commentary<ENTER>

"CTRL-P
let g:ctrlp_map = '<c-p>' 
let g:ctrlp_cmd = 'CtrlP'

"NerdTree
let NERDTreeShowHidden=1 "show hidden files
let NERDTreeIgnore=['\.gitkeep$', '\.DS_Store', '\.swp$'] "ignore specific filetypes by NERDTree

" RSpec.vim mappings
map <Leader>w :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

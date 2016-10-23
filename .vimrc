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
set colorcolumn=80 "make a line at vertical length 80
set wildmenu "show matching autocomplete commands in command mode
set showmatch "show matching parenthesis/braces
set nowrap "dont wrap lines
set backspace=indent,eol,start    " backspace through everything in insert mode
set ignorecase "ignore case when searching

set laststatus=2 "show status line"
"status line options
set statusline=%f\ %m\ %r
set statusline+=Line:%l/%L[%p%%]
set statusline+=Col:%v
set statusline+=Buf:#%n

set nrformats= "cause vim to treat 0-padded numbers as decimal so <C-A> on 007 is 008 and not 010

"when opening a file, this brings cursor to last time accessed
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

"map down and up in command mode
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>

set guioptions+=c "remove editing same file issue alert of macvim
set shortmess+=A "remove editing same file issue

"core usage
inoremap jk <esc>
let mapleader = ","

nnoremap <leader>n :NERDTreeToggle<ENTER>
nnoremap <leader>ev :vsplit $MYVIMRC<ENTER>
nnoremap <leader>sv :source $MYVIMRC<ENTER>

nnoremap <leader>u :UltiSnipsEdit<ENTER>

"color solarized light
" syntax enable
" set background=light
" colorscheme solarized

"enable solarized dark
syntax enable
set background=dark
colorscheme solarized

"PLUGIN SETTINGS
"================================================================================
"Ag
nnoremap <D-F> :Ag<Space>
nnoremap <leader><D-F> :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

"Commentary
noremap <D-/> :Commentary<ENTER>

"CTRL-P
let g:ctrlp_map = '<c-p>' 
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_max_files=0

"NerdTree
let NERDTreeShowHidden=1 "show hidden files
let NERDTreeIgnore=['\.gitkeep$', '\.DS_Store', '\.swp$', '\.swo$'] "ignore specific filetypes by NERDTree

" RSpec.vim mappings
let g:rspec_runner = "os_x_iterm2"
map <Leader>w :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<leader><tab>"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_quiet_messages = { "level" : "warnings" }
let g:syntastic_html_tidy_ignore_errors = [ '<template> is not recognized!' ]
let g:syntastic_javascript_checkers = ['eslint']

" Vim Vinegar
let NERDTreeHijackNetrw = 1

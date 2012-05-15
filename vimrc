" Activate pathogen
filetype off
call pathogen#infect()

" Shortcut to rapidly toggle 'set list'
nmap <leader>l :set list!<CR>

" User the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Set indentation preferences
set ts=4 sts=4 sw=4 expandtab
set autoindent
set smartindent

" Wrapping
"set textwidth=79
"set wrap

" Code folding
set foldmethod=indent
set foldlevel=99

" Make moving around wrapped lines easier
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

" Settings for vim compiled with autocmd enabled
if has("autocmd")
    " Enable file type detection
    filetype on

    " Syntax of these languages is fussy over tabs vs spaces
    autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " Smartindent not good for python
    autocmd FileType python setlocal nosmartindent

    " Clean trailing whitespace on buffer write
    autocmd BufWritePre *.py,*.js,*.c,*.h,*.cpp :call Preserve("%s/\\s\\+$//e")

    " Source the vimrc file after saving it
    autocmd BufWritePost .vimrc,vimrc source $MYVIMRC
endif

function! Preserve(command)
    " Save history
    let _s=@/
    " Save cursor position
    let l = line(".")
    let c = col(".")
    " Execute command
    execute a:command
    " Restore history and cursor
    let @/=_s
    call cursor(l,c)
endfunction

" Use _$ as a shortcut to remove trailing whitespace in a file
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>

" Make shifting between windows easier
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

filetype plugin indent on
syntax on
set ruler
set number
set showmatch
set t_Co=256
colorscheme molokai

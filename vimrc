" Activate pathogen
call pathogen#infect()

" Shortcut to rapidly toggle 'set list'
nmap <leader>l :set list!<CR>

" User the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Set indentation preferences
set ts=4 sts=4 sw=4 expandtab

" Settings for vim compiled with autocmd enabled
if has("autocmd")
    " Enable file type detection
    filetype on

    " Syntax of these languages is fussy over tabs vs spaces
    autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " Clean trailing whitespace on buffer write
    autocmd BufWritePre *.py,*.js,*.c,*.h,*.cpp :call Preserve("%s/\\s\\+$//e")
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

filetype plugin on
syntax on
set autoindent
set ruler
set nu
set showmatch
set t_Co=256
colorscheme molokai

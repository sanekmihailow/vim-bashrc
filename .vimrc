runtime! debian.vim

"------------------------------------- autostart syntax -------------------------------

"log webserver
au BufRead *access.log* setf httplog

"conf asterisk
au BufNewFile,BufRead *asterisk*/*voicemail.conf* setf asteriskvm
au BufNewFile,BufRead *asterisk/*.conf* setf asterisk
au BufNewFile,BufRead *asterisk/*.ael* setf asterisk

"--------------------------------------------------------------------------------------

if has("syntax")
  syntax on
endif

set background=dark
colorscheme sm

"LOG syntax
syn match log_comment   '\c\#.*$'
syn match log_comment   '\c\^#.*$'
syn match log_comment   '\c\^;.*$'
syn match log_comment   '\c\^".*$'
hi link log_comment             Comment

" ------------------------------------- maps
nmap <F1> :set autoread<CR>
nmap <F2> :au CursorMoved * checktime<CR>
nmap <F3> :q!<CR>
nmap <F4> :set syntax=log<CR>
nmap <F5> :colorscheme sm<CR>
nmap <F6> :colorscheme desert<CR>
nmap <F7> :colorscheme xoria256<CR>
nmap <F8> :colorscheme noctu<CR>
nmap <F9> zfa(<CR>
nmap <F10> zfa[<CR>
nmap <F11> zfa{<CR>
nmap <F12> zO<CR>
nmap <C-x> :set nonumber<CR>
vmap <C-t> <Leader>t
"                     " in cli mode use :ww
cmap ww %!sudo tee %
       "cmap ww :w !sudo sh -c "cat > %"
cmap nn echo expand('%:p')

" ------------------------------------ reg
set showcmd        
set showmatch      
set ignorecase     
set hlsearch
set number
set infercase
set incsearch
set smartcase
set ruler
set nocompatible
set backspace=indent,eol,start
" tab = 4 spaces
set expandtab ts=4 sw=4 ai

if has('mouse')
  set mouse=v
endif


if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"--------------------------------------- screen title
if &term == "screen"
  let &titlestring = "vim(" . expand("%:t") . ")"
"  set t_ts=^[k
"  set t_fs=^[\
"  set title
endif
autocmd TabEnter,WinEnter,BufReadPost,FileReadPost,BufNewFile * let &titlestring = 'vim(' . expand("%:t") . ')'

" ============================== vim 8 ===============================
" set display=truncate

" if has("autocmd")
"   filetype plugin indent on
"  augroup vimStartup
"    au!
"    autocmd BufReadPost *
"      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
"      \ |   exe "normal! g`\""
"     \ | endif

"  augroup END

" endif " has("autocmd")

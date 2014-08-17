syntax enable
filetype plugin indent on
set t_Co=256
"colorscheme mrkn256
set ambiwidth=double
set autoread
set autoindent
set backup
set backupcopy&
set backupdir=$HOME/.vimbackup
set backspace=indent,eol,start
set nocompatible
set directory=.,~/tmp
set formatoptions+=mM
set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
set fileformats=unix,dos,mac
set hidden
set history=100
set hlsearch
nohlsearch
set incsearch
set ignorecase
set laststatus=2
set loadplugins
set number
set ruler
set shiftwidth=2
set showcmd
set noshowmode
set showmatch
set smartindent 
set tabstop=2
set tags=tags;
set undodir=~/.vimundo
set undofile
set viminfo=<50,'10,h,:10,/10,n~/.viminfo
set viewdir=~/.vim_view
set virtualedit& virtualedit+=block
set viewoptions&
set viewoptions-=options
set visualbell t_vb=
set wildmenu

let &statusline = ''
let &statusline .= '%<%f %h%m%r%w'
let &statusline .= '%='
let &statusline .= '[%{pathshorten(getcwd())}]'
let &statusline .= '%y'
let &statusline .= '[%{&l:fileencoding == "" ? &encoding : &l:fileencoding}]'
let &statusline .= '['.&ff.']'
let &statusline .= ' %-14.(%l,%c%V%) %P'

nnoremap j gj
nnoremap k gk
noremap ; :
noremap : ;
noremap <Space>w :<C-u>update<CR>
noremap <Space>W :<C-u>update!<CR>
noremap <Space>q :<C-u>quit<CR>
noremap <Space>Q :<C-u>quit!<CR>

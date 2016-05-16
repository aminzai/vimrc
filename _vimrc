"========================================== 
" Author    : Kang-min Wang ( Aminzai )
" E-mail    : lagunawang --AT-- Gmail.com
"==========================================
"
"
"========================================== 
" Style Setting 
"========================================== 
"
" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" Don't Compatible with vi
set nocompatible

" You can also specify a different font, overriding the default font
"if has('gui')
"  set guifont=WenQuanYi\ Micro\ Hei\ Mono\ 10
"  "set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
"endif

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" Show Tabline
set showtabline=2

" Set Gvim Style
if has('gui')
    "remove Toolbar
    set guioptions-=T
    " Add tab page
    set guioptions-=e
endif

" Set Color Sheme
"colorscheme wombat256
"color wombat256
"colorscheme desertEx
"color desertEx
"colorscheme wombat256mod
"color wombat256mod
colorscheme Monokai
color Monokai

"" Wild Mode
"set wildmode=full,list
"set wildmode=list:full
set wildmode=longest,list
set wildignore+=*.o,*.a,*.so,*.obj,*.exe,*.lib,*.ncb,*.opt,*.plg,.svn,.git
set wildignore+=*.png,*.jpg,*.gif,*.svg,*.xpm
" set wildoptions
"set  winaltkeys=no

" Set Cursor Line
set cursorline

" Status Line
set laststatus=2
"set   statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",bom\":\"\")}]\ %-14.(%l,%c%v%)\ %p
" set statusline=File:\ %t\%r%h%w\ [%{&ff},%{&fileencoding},%Y]\ %m%=\ [AscII=\%03.3b]\ [Hex=\%02.2B]\ [Pos=%l,%v,%p%%]\ [LINE=%L]

" Do not redraw while running macros ( much faster )
set lazyredraw

" Don't make noise
set noerrorbells

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
if !has('gui')
  set background=dark
endif

" Set vim 256 Color
set t_Co=256

" Syntax color ON
syntax on

"Set File encodeings
set fileencodings=utf8,big5,gbk

" Set Split
"set splitbelow
"set splitright

"Show Line number
set number

"Set Tab Width
set tabstop=8

"Set Tab to Space
set expandtab

"Set Show Command
set showcmd

"Show Mode
set showmode

"Set no Wrap
set nowrap

"Set Soft tab stop
set softtabstop=8

"Set Soft tab width
set shiftwidth=8

" Don't Save Backup file
set nobackup

" Set Folding 
"set foldenable
"set foldmethod=indent
"set foldcolumn=3

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Indents
set autoindent
set smartindent
set cindent

"Show Row & Colume position
set ruler

"Support mouse
set mouse=a

" Hightlight in Search
set hlsearch

" Incremental Search 輸入字串就顯示匹配點
set incsearch

" Set Scroll setting
set scrolloff=3
set scrolljump=5


"========================================== 
" Addition Command
"========================================== 
"
" Reload vimrc 
" com! ReloadConfig source $MYGVIMRC



"========================================== 
" Shorecut
"========================================== 

" Save File
nmap <c-s> :w<CR>
imap <c-s> <ESC>:w<CR>i

" Quit
nmap <leader>q :q<CR>

" Open file by Explore
nmap <m-o> :Explore<CR>

" Open file by EnerdTreexpore
nmap <C-m-o> :vsplit<CR>:Explore<CR>

" Winalt Window
nn <c-=> <c-w>=

" Tab Page
"nn <C-m-t> :tabnew<CR>
"nn <C-m-o> :tabnew<CR>:Explore<CR>
"nn <C-tab> :tabNext<CR>
nn tn :<C-u>tabnew<CR>
nn te :<C-u>Texplore<CR>
nn th :<C-u>tabprev<CR>
nn tl :<C-u>tabnext<CR>
nn tc :<C-u>tabclose<CR>

" Shift Tab
nmap <tab> v>
nmap <s-tab> v<
xnoremap <tab> >gv
"vmap <tab> >gv
xnoremap <s-tab> <gv
map <A-1> :tabn1 <CR>
map <A-2> :tabn2 <CR>
map <A-3> :tabn3 <CR>
map <A-4> :tabn4 <CR>
map <A-5> :tabn5 <CR>
map <A-6> :tabn6 <CR>
map <A-7> :tabn7 <CR>
map <A-8> :tabn8 <CR>
map <A-9> :tabn9 <CR>


" Command Mode
cmap <c-a> <home>
cmap <c-e> <end>
cnoremap <c-b> <left>
cnoremap <c-f> <right>
cnoremap <c-n> <down>
cnoremap <c-p> <up>
cnoremap <c-d> <del>

" Add time
imap      <F2>    <c-r>=strftime("%c")<CR>
if has('win32')
    nmap      <leader>r   :source ~/_vimrc<CR>
else
    nmap      <leader>r   :source ~/.vimrc<CR>
endif



"========================================== 
" Syntax
"========================================== 


"========================================== 
" Module Seting
"========================================== 


"""""""""""
"Vundle (VIM model tool)
"""""""""""

filetype off                   " required!

"use git:// as bundle default protocal
"let g:vundle_default_git_proto = 'git'

if has('win32')
    "set rtp+=%UserProfile%\vimfiles/bundle/vundle/
    set rtp+=%UserProfile%\vimfiles/bundle/neobundle.vim/
else
    set rtp+=~/.vim/bundle/neobundle.vim/
endif


call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

if has('win32')
    source ~\vimfiles\BundleList.vim
else
    source ${HOME}/.vim/BundleList.vim
endif 

call neobundle#end()



filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
"if neobundle#exists_not_installed_bundles()
"  echomsg 'Not installed bundles : ' .
"        \ string(neobundle#get_not_installed_bundle_names())
"  echomsg 'Please execute ":NeoBundleInstall" command.'
"  "finish
"endif

NeoBundleCheck

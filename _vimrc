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
colorscheme desertEx
color desertEx

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
set statusline=File:\ %t\%r%h%w\ [%{&ff},%{&fileencoding},%Y]\ %m%=\ [AscII=\%03.3b]\ [Hex=\%02.2B]\ [Pos=%l,%v,%p%%]\ [LINE=%L]

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
set tabstop=4

"Set Tab to Space
set expandtab

"Set Show Command
set showcmd

"Show Mode
set showmode

"Set no Wrap
" set nowrap

"Set Soft tab stop
set softtabstop=4

"Set Soft tab width
set shiftwidth=4

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
" set mouse=a

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
    set rtp+=%UserProfile%\vimfiles/bundle/vundle/
else
    set rtp+=~/.vim/bundle/vundle/
endif

call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

filetype plugin indent on     " required! 


""" snipMate 
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"
""" End snipMate 

""" NERDTree
Bundle "scrooloose/nerdtree"
nmap <leader>e :<C-u>NERDTree<CR>
""" End NERDTree

""" TagList
""Bundle 'taglist.vim'
""nmap <leader>t :<C-u>Tlist<CR>
""" End TagList

""" Tagbar
Bundle "majutsushi/tagbar"
nmap <leader>t :<C-u>TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

if has('win32')
    let g:tagbar_ctags_bin='C:\ctags.exe'
endif

""" Omni Complete
set ofu=syntaxcomplete#Complete

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"" OmniCppComplete
Bundle 'OmniCppComplete'

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set tags+=~/vimfiles/tags/tags
set tags+=~/vimfiles/tags/c++.tags
set tags+=~/vimfiles/tags/stl-3.3.tags
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
"" pythoncomplete
Bundle 'pythoncomplete'
""" End Omni Complete

""" VST :Vim reStructured Text 
Bundle 'VST'
""" End VST

""" c.vim
" Bundle 'vim-scripts/c.vim'
""" End c.vim

""" vim-surround
Bundle 'tpope/vim-surround'
""" end vim-surround

""" numbers.vim
Bundle "myusuf3/numbers.vim"
nnoremap <F3> :NumbersToggle<CR>
""" end numbers.vim

""ctrlp.vim
Bundle 'kien/ctrlp.vim.git'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

""let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
""end ctrlp.vim

"" easymotion
Bundle 'Lokaltog/vim-easymotion'
""end easymotion

""" Start Syntax
Bundle 'vim-scripts/Python-Syntax'
Bundle 'php.vim'
Bundle 'jQuery'
Bundle 'css_color.vim'
Bundle 'cpp.vim'
Bundle 'django.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'rest.vim'
"set syntax=rest

""" End Syntax


" Sample Bundles here:
"
"" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'rails.vim'
"" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
"
"
"""" Init Env""""

command InitENV call InitBundleEnv()

fun! InitBundleEnv()
   BundleInstall
   quit
   quit
endf

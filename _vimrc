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


call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundle 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'
"NeoBundle 'Shougo/vimproc', {
"      \ 'build' : {
"      "\     'windows' : 'make -f make_mingw32.mak',
"      "\     'cygwin' : 'make -f make_cygwin.mak',
"      \     'mac' : 'make -f make_mac.mak',
"      \     'unix' : 'make -f make_unix.mak',
"      \    },
"      \ }

" My Bundles here:

""" vim-powerline
NeoBundle 'Lokaltog/vim-powerline'
""" vim-powerline end

""" snipMate 
"NeoBundle "MarcWeber/vim-addon-mw-utils"
"NeoBundle "tomtom/tlib_vim"
"NeoBundle "honza/snipmate-snippets"
"NeoBundle "garbas/vim-snipmate"
""" End snipMate 

""" NERDTree
NeoBundle "scrooloose/nerdtree"
nmap <leader>e :<C-u>NERDTree<CR>
""" End NERDTree

""" TagList
NeoBundle 'taglist.vim'
""nmap <leader>t :<C-u>Tlist<CR>
""" End TagList

""" Tagbar
NeoBundle "majutsushi/tagbar"
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
NeoBundle 'OmniCppComplete'

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
NeoBundle 'pythoncomplete'
""" End Omni Complete

""" VST :Vim reStructured Text 
NeoBundle 'VST'
""" End VST

""" c.vim
" Bundle 'vim-scripts/c.vim'
""" End c.vim

""" vim-fugitive (Git Plugin)
NeoBundle 'tpope/vim-fugitive'
"""

""" vim-surround
NeoBundle 'tpope/vim-surround'
""" end vim-surround

""" numbers.vim
"NeoBundle "myusuf3/numbers.vim"
"nnoremap <F3> :NumbersToggle<CR>
""" end numbers.vim

"""SrcExpl
NeoBundle "wesleyche/SrcExpl"
map <leader>s  :<C-u>SrcExplToggle<CR>

" // The switch of the Source Explorer 
" nmap <F8> :SrcExplToggle<CR> 
"
" " // Set the height of Source Explorer window 
" let g:SrcExpl_winHeight = 8 
"
" " // Set 100 ms for refreshing the Source Explorer 
" let g:SrcExpl_refreshTime = 100 
"
" // Set "Enter" key to jump into the exact definition context 
" let g:SrcExpl_jumpKey = "<ENTER>" 
"
" // Set "Space" key for back from the definition context 
" let g:SrcExpl_gobackKey = "<SPACE>" 
"
" " // In order to Avoid conflicts, the Source Explorer should know what  plugins 
" " // are using buffers. And you need add their bufname into the list below 
" " // according to the command ":buffers!" 
 let g:SrcExpl_pluginList = [ 
             \ "__Tag_List__", 
             \ "_NERD_tree_", 
             \ "Source_Explorer" 
             \ ] 
"
" // Enable/Disable the local definition "searching, and note that this is not 
" // guaranteed to work, the Source Explorer "doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" // Do not let the Source Explorer update the "tags file when opening 
let g:SrcExpl_isUpdateTags = 0 

" // Use 'Exuberant Ctags' with '--sort=foldcase "-R .' or '-L cscope.files' to 
" // create/update the tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 

" // Set "<F12>" key for updating the tags file "artificially 
"let g:SrcExpl_updateTagsKey = "<F12>" 

" // Set "<F3>" key for displaying the previous definition in the jump list 
"let g:SrcExpl_prevDefKey = "<F3>" 

" // Set "<F4>" key for displaying the next "definition in the jump list 
"let g:SrcExpl_nextDefKey = "<F4>" 

"""end SrcExpl

"Trinity
NeoBundle "wesleyche/Trinity"

""ctrlp.vim
NeoBundle 'kien/ctrlp.vim.git'
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
NeoBundle 'Lokaltog/vim-easymotion'
""end easymotion

""" Start Syntax
NeoBundle 'vim-scripts/Python-Syntax'
NeoBundle 'php.vim'
NeoBundle 'jQuery'
NeoBundle 'css_color.vim'
NeoBundle 'cpp.vim'
NeoBundle 'django.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'rest.vim'
NeoBundle 'flazz/vim-colorschemes'
"set syntax=rest

""" End Syntax
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
"NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'Lokaltog/vim-easymotion'
"NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
"NeoBundle 'L9'
"NeoBundle 'FuzzyFinder'
"NeoBundle 'rails.vim'
" Non github repos
"NeoBundle 'git://git.wincent.com/command-t.git'
" Non git repos
"NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
"NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

" ...

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

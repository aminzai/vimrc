
"vimproc
" NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

""" vim-airline
NeoBundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

NeoBundle "mhinz/vim-signify"

NeoBundle "edkolev/promptline.vim"

""" NERDTree
NeoBundle "scrooloose/nerdtree"
nmap <leader>e :<C-u>NERDTree<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']
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

""" You Complete Me
NeoBundle "Valloric/YouCompleteMe"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

""" VST :Vim reStructured Text 
NeoBundle 'VST'
""" End VST

"""SrcExpl
NeoBundle "wesleyche/SrcExpl"
map <leader>s  :<C-u>SrcExplToggle<CR>

" // The switch of the Source Explorer 
"nmap <F8> :SrcExplToggle<CR> 
"
" " // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 
"
" " // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 
"
" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set "Space" key for back from the definition context 
 let g:SrcExpl_gobackKey = "<SPACE>" 
"
" " // In order to Avoid conflicts, the Source Explorer should know what  plugins 
" " // are using buffers. And you need add their bufname into the list below 
" " // according to the command ":buffers!" 
let g:SrcExpl_pluginList = [ 
            \ "_NERD_tree_" ,
            \ "__Tag_List__", 
            \ ] 
            "\ "Source_Explorer" 

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
let g:SrcExpl_updateTagsKey = "<F12>" 

" // Set "<F3>" key for displaying the previous definition in the jump list 
let g:SrcExpl_prevDefKey = "<F3>" 

" // Set "<F4>" key for displaying the next "definition in the jump list 
let g:SrcExpl_nextDefKey = "<F4>" 

"""end SrcExpl

"Trinity
NeoBundle "wesleyche/Trinity"
" Open and close all the three plugins on the same time 
nmap <F8>  :TrinityToggleAll<CR> 

" Open and close the Source Explorer separately 
nmap <F9>  :TrinityToggleSourceExplorer<CR> 

" Open and close the Taglist separately 
nmap <F10> :TrinityToggleTagList<CR> 

" Open and close the NERD Tree separately 
nmap <F11> :TrinityToggleNERDTree<CR>  

""ctrlp.vim
NeoBundle 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc'
 
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*pyc     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
 let g:ctrlp_custom_ignore = {
   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
   \ 'file': '\v\.(exe|so|dll)$',
   \ 'link': 'some_bad_symbolic_links',
   \ }
""end ctrlp.vim

""" Start Syntax
NeoBundle "pangloss/vim-javascript"

""" Numbers
NeoBundle "myusuf3/numbers.vim"
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

NeoBundle 'flazz/vim-colorschemes'

""" Easy motion
NeoBundle 'easymotion/vim-easymotion'

""" flake8-vim
NeoBundle 'andviro/flake8-vim'

""" Syntastic
NeoBundle 'scrooloose/syntastic'
" let g:syntastic_python_checkers = ['pylint']

""" bitbake
NeoBundle 'kergoth/vim-bitbake'

""" Simpyl Fold 
NeoBundle 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview = 0
let g:SimpylFold_fold_import = 1

""" End Syntax
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
"NeoBundle 'tpope/vim-fugitive'
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

set listchars=eol:$,tab:\»\ ,trail:~,extends:>,precedes:<

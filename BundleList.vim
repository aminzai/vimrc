
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



""" vim-powerline
"NeoBundle 'Lokaltog/vim-powerline'

""" vim-airline
NeoBundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

NeoBundle "mhinz/vim-signify"

NeoBundle "edkolev/promptline.vim"

""" snipMate 
" NeoBundle "MarcWeber/vim-addon-mw-utils"
" NeoBundle "tomtom/tlib_vim"
" NeoBundle "garbas/vim-snipmate"
" "" Optional:
" NeoBundle "honza/vim-snippets"
" NeoBundle "jamescarr/snipmate-nodejs"
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

""" You Complete Me
NeoBundle "Valloric/YouCompleteMe"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

""" Omni Complete
"set ofu=syntaxcomplete#Complete

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
""autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"" OmniCppComplete
"NeoBundle 'OmniCppComplete'

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"set tags+=~/vimfiles/tags/tags
"set tags+=~/vimfiles/tags/c++.tags
"set tags+=~/vimfiles/tags/stl-3.3.tags
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"let OmniCpp_MayCompleteDot = 1 " autocomplete with .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
"let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
"let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
""" pythoncomplete
"NeoBundle 'pythoncomplete'
""" End Omni Complete

""" VST :Vim reStructured Text 
NeoBundle 'VST'
""" End VST

""" c.vim
" Bundle 'vim-scripts/c.vim'
""" End c.vim

""" vim-fugitive (Git Plugin)
"NeoBundle 'tpope/vim-fugitive'
"""

""" vim-surround
"NeoBundle 'tpope/vim-surround'
""" end vim-surround

""" numbers.vim
"NeoBundle "myusuf3/numbers.vim"
"nnoremap <F3> :NumbersToggle<CR>
""" end numbers.vim

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
NeoBundle 'kien/ctrlp.vim.git'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
 
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
 let g:ctrlp_custom_ignore = {
   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
   \ 'file': '\v\.(exe|so|dll)$',
   \ 'link': 'some_bad_symbolic_links',
   \ }
""end ctrlp.vim

"" easymotion
"NeoBundle 'Lokaltog/vim-easymotion'
""end easymotion

""" Start Syntax
" NeoBundle 'vim-scripts/Python-Syntax'
NeoBundle "pangloss/vim-javascript"
" NeoBundle 'php.vim'
" NeoBundle 'jQuery'
" NeoBundle 'css_color.vim'
" NeoBundle 'cpp.vim'
" NeoBundle 'django.vim'
" NeoBundle 'plasticboy/vim-markdown'
" NeoBundle 'rest.vim'
"set syntax=rest
"
NeoBundle 'flazz/vim-colorschemes'

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

"NeoBundle 'Yggdroot/indentLine'
"show indent guides
"set list
"set listchars=tab:\⁞\ 
"set listchars=tab:\»\ 
set listchars=eol:$,tab:\»\ ,trail:~,extends:>,precedes:<

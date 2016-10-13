let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1

Plug 'mhinz/vim-signify' "Show a diff via Vim sign column.

Plug 'scrooloose/nerdtree'
nmap <leader>e :<C-u>NERDTree<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']

Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1

Plug 'taglist.vim'
"nmap <leader>t :<C-u>Tlist<CR>

Plug 'majutsushi/tagbar'
nmap <leader>t :<C-u>TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
if has('win32')
    let g:tagbar_ctags_bin='C:\ctags.exe'
endif

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

Plug 'VST' "Vim reStructured Text 

Plug 'wesleyche/SrcExpl'
map <leader>s  :<C-u>SrcExplToggle<CR>
" The switch of the Source Explorer 
" nmap <F8> :SrcExplToggle<CR> 
" Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 
" Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 
" Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 
" Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 
" In order to Avoid conflicts, the Source Explorer should know what  plugins 
" are using buffers. And you need add their bufname into the list below 
" according to the command ":buffers!" 
let g:SrcExpl_pluginList = [ 
            \ "_NERD_tree_" ,
            \ "__Tag_List__", 
            \ ] 
            "\ "Source_Explorer" 
" Enable/Disable the local definition "searching, and note that this is not 
" guaranteed to work, the Source Explorer "doesn't check the syntax for now. 
" It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 
" Do not let the Source Explorer update the "tags file when opening 
let g:SrcExpl_isUpdateTags = 0 
" Use 'Exuberant Ctags' with '--sort=foldcase "-R .' or '-L cscope.files' to 
" create/update the tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
" Set "<F12>" key for updating the tags file "artificially 
let g:SrcExpl_updateTagsKey = "<F12>" 
" Set "<F3>" key for displaying the previous definition in the jump list 
" let g:SrcExpl_prevDefKey = "<F3>" 
" Set "<F4>" key for displaying the next "definition in the jump list 
" let g:SrcExpl_nextDefKey = "<F4>" 
"
Plug 'wesleyche/Trinity'
" Open and close all the three plugins on the same time 
nmap <F8>  :TrinityToggleAll<CR> 
" Open and close the Source Explorer separately 
nmap <F9>  :TrinityToggleSourceExplorer<CR> 
" Open and close the Taglist separately 
nmap <F10> :TrinityToggleTagList<CR> 
" Open and close the NERD Tree separately 
nmap <F11> :TrinityToggleNERDTree<CR>  

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
   \ 'file': '\v\.(exe|so|dll)$',
   \ 'link': 'some_bad_symbolic_links',
   \ }

Plug 'myusuf3/numbers.vim'
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

Plug 'flazz/vim-colorschemes'

Plug 'easymotion/vim-easymotion'

"Plug 'nvie/vim-flake8'
"autocmd BufWritePost *.py call Flake8()
"let g:flake8_show_in_gutter=1  " show
"let g:flake8_show_in_file=1  " show

Plug 'scrooloose/syntastic'
let g:syntastic_python_checkers = ['flake8', 'frosted', 'pep8', 'pylint']
"let g:syntastic_python_checkers = ['prospector']
let g:syntastic_python_python_use_codec = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

Plug 'kergoth/vim-bitbake'

Plug 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview = 0
let g:SimpylFold_fold_import = 1

call plug#end()

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

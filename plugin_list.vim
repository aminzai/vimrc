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

Plug 'majutsushi/tagbar'
nmap <leader>t :<C-u>TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
if has('win32')
    let g:tagbar_ctags_bin='C:\ctags.exe'
endif

Plug 'vim-scripts/VST' "Vim reStructured Text 

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

Plug 'kergoth/vim-bitbake'

Plug 'editorconfig/editorconfig-vim'

Plug 'Yggdroot/indentLine'
let g:indentLine_enabled = 1

Plug 'ntpeters/vim-better-whitespace'

Plug 'pearofducks/ansible-vim'

Plug 'tpope/vim-fugitive'

" Plug 'plasticboy/vim-markdown'
" Plug 'iamcco/mathjax-support-for-mkdp'
" Plug 'iamcco/markdown-preview.vim'

call plug#end()

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

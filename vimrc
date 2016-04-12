" ========================================================================
" Vundle stuff
" ========================================================================
set nocompatible " Required by vundle
filetype off     " Required by vundle

" Based on http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let need_to_install_plugins=0
if empty(system("grep lazy_load ~/.vim/bundle/vundle/autoload/vundle.vim"))
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !rm -rf ~/.vim/bundle/vundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let need_to_install_plugins=1
endif

" Set runtime path to include Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" General Editing
Plugin 'godlygeek/tabular'
Plugin 'Valloric/YouCompleteMe'

" Themes
Plugin 'nanotech/jellybeans.vim'

" Searching
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'

" Languages
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'chrisbra/csv.vim'	
Plugin 'isRuslan/vim-es6'

" All of your Plugins must be added before the following line
call vundle#end()            " vundle required
filetype plugin indent on    " vundle required

if need_to_install_plugins == 1
  echo "Installing plugins via Vundle. Please ignore warnings afterwards."
  echo "This is a one-time operation that will take about a minute..."
  silent! PluginInstall
  echo "Done installing Vundle plugins!"
  q
endif

" ========================================================================
" General Stuff
" ========================================================================
colorscheme jellybeans
set relativenumber
syntax on
let mapleader = ','
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500                " keep 500 lines of command line history
set ruler                      " show cursor position at all times
set backupdir=~/.tmp
set directory=~/.tmp " don't clutter up dir with swp and tmp files
set showcmd          " display incomplete commands
set incsearch        " do incremental searching
set laststatus=2     " Always display the status line

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" ========================================================================
" Plugin Settings
" ========================================================================
" Don't fold markdown
let g:vim_markdown_folding_disabled = 1

" Map ctrlP 'f' for 'find'
let g:ctrlp_map = '<leader>f'

" =========
" Searching
" =========
" Use Silver Searcher instead of grep - brew install the_silver_searcher
set wildignore+=tmp/**                " Ignore stuff that can't be opened

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " Without --hidden, it never finds .travis.yml since it starts with a dot
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " https://github.com/kien/ctrlp.vim/issues/174
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
endif

" ========================================================================
" Key mappings
" ========================================================================

" Re-source my vimrc
map <Leader>so :so %<cr>

" Install Vundle Plugins
map <Leader>pi :PluginInstall<cr>

" Align by text by = or :
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

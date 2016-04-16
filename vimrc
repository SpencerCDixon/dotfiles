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
Plugin 'gmarik/Vundle.vim'        " vim package manager

" General Editing
Plugin 'SirVer/ultisnips'         " snippets
Plugin 'Valloric/YouCompleteMe'   " inline autocomplete
Plugin 'ervandew/supertab'        " util for <tab> with snippets
Plugin 'godlygeek/tabular'        " text aligning
Plugin 'honza/vim-snippets'       " faster code generation
Plugin 'scrooloose/nerdcommenter' " easy code commenting
Plugin 'tpope/vim-endwise'        " autocomplete 'end's
Plugin 'airblade/vim-gitgutter'   " git changes in gutter
Plugin 'tpope/vim-surround'       " change surrounding characters quickly
Plugin 'scrooloose/syntastic'     " automatic linting inside vim

" Themes
Plugin 'nanotech/jellybeans.vim'  " yummy
Plugin 'mhartington/oceanic-next' " ideal for React/ES6 development

" Airline
Plugin 'vim-airline/vim-airline'  " useful metadata and mode identifier

" Searching
Plugin 'kien/ctrlp.vim'           " search file system
Plugin 'rking/ag.vim'             " integrate with silver searcher

" Navigation
Plugin 'scrooloose/nerdtree'      " file system bar

" Languages
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'chrisbra/csv.vim'
Plugin 'othree/yajs.vim'          " better js highlighting
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'vim-perl/vim-perl'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

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
syntax on
let mapleader = ','
scriptencoding utf-8

" Theme
syntax enable
colorscheme OceanicNext
set autoread                   " no prompt for file changes outside Vim
set background=dark
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set backupdir=~/.tmp
set directory=~/.tmp           " don't clutter up dir with swp and tmp files
set expandtab                  " use soft tabs
set hidden                     " allow hidden, unsaved buffers
set history=500                " keep 500 lines of command line history
set hlsearch                   " highlight all search results
set incsearch                  " do incremental searching
set laststatus=2               " always display the status line
set laststatus=2               " always show statusline
set list                       " show whitespace
set listchars=trail:·          " whitespace character
set mouse=a                    " use mouse support in XTerm/iTerm.
set relativenumber
set ruler                      " show cursor position at all times
set scrolloff=3                " scroll when the cursor is 3 lines from edge
set shiftwidth=2
set showcmd                    " display incomplete commands
set showmatch                  " show matching brackets
set splitbelow                 " add new windows towards the bottom
set splitright                 " add new windows towards the right
set swapfile                   " keep swapfiles
set t_Co=256                   " terminal colors
set tabstop=2                  " tab settings
set textwidth=80               " line wrap at 80 characters for Ruby Convention
set wildmode=list:longest      " bash-like tab completion

" Write all writeable buffers when changing buffers or losing focus.
set autowriteall                " Save when doing various buffer-switching things.
autocmd BufLeave,FocusLost * silent! wa  " Save anytime we leave a buffer or MacVim loses focus.

" ========================================================================
" Plugin Settings
" ========================================================================
" Don't fold markdown
let g:vim_markdown_folding_disabled = 1

" Map ctrlP 'f' for 'find'
let g:ctrlp_map = '<leader>f'

" Pad comment delimeters with spaces
let NERDSpaceDelims = 1
let NERDTreeShowHidden=1

" Use consistent theme for airline
let g:airline_theme='oceanicnext'

" Allow jsx syntax highlighting with .js extensions
let g:jsx_ext_required=0

" Turn on syntax highlighting for ruby operators (==, ||, &&, etc)
let ruby_operators=1

" recommended by gitgutter
set updatetime=250

" ========================================================================
" Searching
" ========================================================================
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
map <Leader>sv :so $MYVIMRC<cr>

" Edit <useful files>
map <leader>ev :vsplit $MYVIMRC<cr>
map <leader>ea :vsplit ~/.dotfiles/aliases<cr>
map <leader>et :vsplit ~/Dropbox/docs/todos.md<cr>
map <leader>eb :vsplit ~/Dropbox/docs/bug-journal.md<cr>

" Install Vundle Plugins
map <Leader>pi :PluginInstall<cr>
" File tree browser
map \ :NERDTreeToggle<cr>

" File tree browser showing current file - pipe (shift-backslash)
map \| :NERDTreeFind<cr>

" Easy access to the shell
map <Leader><Leader> :!

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<cr>""
nnoremap <Space><Space> <c-^>

" Align by text by = or :
nmap <Leader>a= :Tabularize /=<cr>
vmap <Leader>a= :Tabularize /=<cr>
nmap <Leader>a: :Tabularize /:\zs<cr>
vmap <Leader>a: :Tabularize /:\zs<cr>

"indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

" Quicker window movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Substitution
nmap <Leader>s  :%s/

" Alphabetically Sort
vmap <Leader>as :sort<cr>
nmap <Leader>as :sort<cr>

" Commenting
map <Leader>/ <plug>NERDCommenterToggle

" Tab Movement
nnoremap <leader>j :tabnext<cr>
nnoremap <leader>k :tabprevious<cr>

" Auto indent the whole file
nmap <leader>=  gg=G``

" Fast scrolling
nnoremap <C-e>  3<C-e>
nnoremap <C-y>  3<C-y>

" ========================================================================
" Abbreviations
" ========================================================================
iabbrev @@ spencercdixon@gmail.com
iabbrev adn and
iabbrev que queue
iabbrev teh the

" ========================================================================
" Autocommands
" ========================================================================
augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd BufRead,BufNewFile *.md setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

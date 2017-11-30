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
Plugin 'AndrewRadev/splitjoin.vim'      " Allows gS and gJ in Go for easy struct changing
Plugin 'SirVer/ultisnips'               " snippets
Plugin 'Valloric/YouCompleteMe'         " inline autocomplete
Plugin 'airblade/vim-gitgutter'         " git changes in gutter
Plugin 'editorconfig/editorconfig-vim'  " detect .editorconfigs and adjust my settings
Plugin 'ervandew/supertab'              " util for <tab> with snippets
Plugin 'evansalter/vim-checklist'       " sweet markdown checklists
Plugin 'gcmt/taboo.vim'                 " rename tabs for easier code navigation
Plugin 'godlygeek/tabular'              " text aligning
Plugin 'honza/vim-snippets'             " basic snippets to use with UltiSnips
Plugin 'itchyny/lightline.vim'          " minimal airline that is easier to configure
Plugin 'majutsushi/tagbar.git'          " tagbar to display ctags
Plugin 'scrooloose/nerdcommenter'       " easy code commenting
Plugin 'tpope/vim-bundler'              " wrapper for bundler
Plugin 'tpope/vim-endwise'              " autocomplete 'end's
Plugin 'tpope/vim-fugitive'             " useful git commands
Plugin 'tpope/vim-rails'                " rails shortcuts
Plugin 'tpope/vim-repeat'               " allow '.' repeat for vim-surround
Plugin 'tpope/vim-surround'             " change surrounding characters quickly
Plugin 'wakatime/vim-wakatime'          " for tracking coding

" Code Formatting
Plugin 'fleischie/vim-styled-components' " format styled components properly
Plugin 'flowtype/vim-flow'               " do flow syntax checking on save
Plugin 'prettier/vim-prettier'           " Adds support for prettier
Plugin 'ternjs/tern_for_vim'             " required for youcompleteme in JS
Plugin 'w0rp/ale'                        " async linting/formatting
Plugin 'alvan/vim-closetag'              " auto close tags
Plugin 'hashivim/vim-terraform'          " autoformatting for terraform

" Themes
" Plugin 'mhartington/oceanic-next'  " ideal for React/ES6 development
" Plugin 'lifepillar/vim-solarized8'   " solarized for writing prose
Plugin 'trevordmiller/nova-vim'      " modern looking flat colors for es6
Plugin 'fatih/molokai'               " useful colorscheme for Go code

" Searching
Plugin 'junegunn/fzf.vim'
set rtp+=/usr/local/opt/fzf       " Adds fzf to vim PATH

" Navigation
Plugin 'scrooloose/nerdtree'      " file system bar

" Nova Plugins (required to get nice JS styles)
Plugin 'pangloss/vim-javascript'   
Plugin 'mxw/vim-jsx'
Plugin 'othree/html5.vim'          " HTML5 syntax highlighting

" General languages
Plugin 'chrisbra/csv.vim'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'jparise/vim-graphql'
Plugin 'junegunn/vim-emoji'
Plugin 'kovisoft/slimv'            
Plugin 'plasticboy/vim-markdown'
Plugin 'posva/vim-vue'
Plugin 'vim-ruby/vim-ruby'

" Writing Prose
Plugin 'davidbeckingsale/writegood.vim' " write better english 
Plugin 'junegunn/goyo.vim'              " enter zen prose mode

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
colorscheme nova

set autoread                   " no prompt for file changes outside Vim
set background=dark
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp       " don't clutter up dir with swp and tmp files
set expandtab                  " use soft tabs
set hidden                     " allow hidden, unsaved buffers
set history=750                " keep 750 lines of command line history
set hlsearch                   " highlight all search results
set incsearch                  " do incremental searching
set laststatus=2               " always display the status line
set laststatus=2               " always show statusline
set list                       " show whitespace
set listchars=trail:·          " whitespace character
set mouse=a                    " use mouse support in XTerm/iTerm.
set relativenumber
set number
set ruler                      " show cursor position at all times
set scrolloff=3                " scroll when the cursor is 3 lines from edge
set shiftwidth=2
set showcmd                    " display incomplete commands
set showmatch                  " show matching brackets
set shiftround                 " use multiple of shiftwidth when indenting with '<' and '>'
set splitbelow                 " add new windows towards the bottom
set splitright                 " add new windows towards the right
set swapfile                   " keep swapfiles
set termguicolors              " set true color to work with themes

if !has('gui_running')
  set t_Co=256                 " terminal colors

  " Fix weird tmux background color issues
  " https://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging
  if $TMUX != ""
    set t_ut=
  endif
endif

set tabstop=2                  " tab settings
set textwidth=80               " line wrap at 80 characters for Ruby Convention
" set wildmode=list:longest      " bash-like tab completion
set wildmenu                   " zsh like tab completion
set wildmode=full              " ^
set nrformats=                 " treat all numbers as base 10
set clipboard=unnamed          " fix copy paste with tmux
set noshowmode                 " --INSERT -- no longer needed with the lightline
" Make tabs look pretty
set listchars=tab:\|\ 

" Write all writeable buffers when changing buffers or losing focus.
set autowriteall                " Save when doing various buffer-switching things.
autocmd BufLeave,FocusLost * silent! wa  " Save anytime we leave a buffer or vim loses focus.

" ========================================================================
" Plugin Settings
" ========================================================================
" Don't fold markdown
let g:vim_markdown_folding_disabled = 1

" Pad comment delimeters with spaces
let NERDSpaceDelims = 1
" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Allow jsx syntax highlighting with .js extensions
let g:jsx_ext_required=0

" Turn on syntax highlighting for ruby operators (==, ||, &&, etc)
let ruby_operators=1

" Recommended by gitgutter
set updatetime=250

" ALE Settings
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}
let g:ale_sign_warning = '🙊'
let g:ale_sign_error = '🔥'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

"" YouCompleteMe
let g:ycm_key_list_previous_completion=['<Up>']

"" Ultisnips
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" Vim Checklist
let g:checklist_filetypes = ['txt', 'md', 'markdown', 'text']

" Emmet configuration
" let g:user_emmet_leader_key='<C-A>'
" let g:user_emmet_settings = {
" \  'javascript' : {
" \      'extends' : 'jsx',
" \  },
" \}

" If this is set to 1, the |quickfix| window opened when the plugin finds an error will close automatically.
let g:flow#autoclose= 1
let g:flow#errjmp= 1
" stop type checking on :w
let g:flow#enable = 0
" useful since I use ALE 
let g:flow#showquickfix = 0

"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
  let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

" Vim Go Settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
let g:go_term_mode = "vsplit"
let g:go_list_type = "quickfix"

" Vim Prettier Settings
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql Prettier
let g:prettier#config#print_width = 80 " max line length that prettier will wrap on
let g:prettier#config#tab_width = 2 " number of spaces per indentation level
let g:prettier#config#use_tabs = 'false' " use tabs over spaces
let g:prettier#config#semi = 'true' " print semicolons
let g:prettier#config#single_quote = 'true' " single quotes over double quotes
let g:prettier#config#bracket_spacing = 'true' " print spaces between brackets
let g:prettier#config#jsx_bracket_same_line = 'true' " put > on the last line instead of new line
let g:prettier#config#trailing_comma = 'all' " none|es5|all
let g:prettier#config#parser = 'babylon' " flow|babylon|typescript|postcss|json|graphql
let g:prettier#config#config_precedence = 'prefer-file' " cli-override|file-override|prefer-file

" Git Gutter Settings
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" Lightline Settings
" Lightline
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ▲', all_non_errors)
endfunction
function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction
function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '😎 ' : ''
endfunction

" Update and show lightline but only if it's visible (e.g., not in Goyo)
autocmd User ALELint call s:MaybeUpdateLightline()
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" FZF configuration
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:closetag_filenames = '*.html,*.jsx'

" ========================================================================
" Searching
" ========================================================================
set wildignore+=tmp/**  " Ignore stuff that won't really be opened frequently

" ========================================================================
" Key mappings
" ========================================================================

" Useful macros:
nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>l :Lines<CR>
" Close quickfix window
nmap \x :cclose<cr> 
" Send repeat command to console tmux pane
" nmap \r :call TmuxPaneRepeat()<cr>
command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>

" Re-source my vimrc
map <Leader>sv :so $MYVIMRC<cr>

" Install Vundle Plugins
map <Leader>pi :PluginInstall<cr>
map <Leader>pu :PluginUpdate<cr>

" Edit <useful files>
map <leader>ev :vsplit $MYVIMRC<cr>
map <leader>ea :vsplit ~/.dotfiles/aliases<cr>
map <leader>et :vsplit ~/Dropbox/docs/todos.md<cr>
map <leader>eb :vsplit ~/Dropbox/docs/bug-journal.md<cr>
map <leader>ep :vsplit ~/Dropbox/docs/athena.md<cr>
map <leader>ew :vsplit ~/Dropbox/docs/writing.md<cr>
map <leader>eb :vsplit ~/Dropbox/docs/blog-posts.md<cr>
map <leader>edj :vsplit ~/Dropbox/docs/dream-journal.md<cr>
map <leader>eg :vsplit ~/Dropbox/docs/goals.md<cr>
map <leader>ek :vsplit ~/Dropbox/docs/kira.rb<cr>
map <leader>ef :vsplit ~/Dropbox/docs/flow.md<cr>
map <leader>en :vsplit ~/notes/readme.md<cr>
map <leader>er :vsplit ~/Dropbox/docs/reading-notes.md<cr>
map <leader>es :UltiSnipsEdit<cr>

" Useful git helpers
map <leader>gs :Gstatus<cr>

" Rename vim tabs quickly
map <leader>tr :TabooRename

" open tabs with command-<tab number>
map <leader>1 :tabn 1<CR>
map <leader>2 :tabn 2<CR>
map <leader>3 :tabn 3<CR>
map <leader>4 :tabn 4<CR>
map <leader>5 :tabn 5<CR>
map <leader>6 :tabn 6<CR>
map <leader>7 :tabn 7<CR>
map <leader>8 :tabn 8<CR>
map <leader>9 :tabn 9<CR>

" Checklists
nnoremap <leader>ct :ChecklistToggleCheckbox<cr>
vnoremap <leader>ct :ChecklistToggleCheckbox<cr>

" File tree browser
map \e :NERDTreeToggle<cr>
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
vmap <Leader>af :Tabularize /from<cr>

" Automatically align text when in insert mode - http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

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

" Better command history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Copy current file path to system pasteboard
map <silent> <D-C> :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>
map <leader>C :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>

" window splitting mappings
nnoremap <leader>v <C-w>v
nnoremap <leader>h <C-w>s

" Rails
nmap <leader>b :BundleInstall<CR>

" Go Vim Mappings
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>a :GoAlternate<cr>
au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

" These might be messing with my quickfix window
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
" map <C-q> :cclose<CR>

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" Adds ctags tag bar 
nmap <leader>tb :TagbarToggle <cr>

" ========================================================================
" Abbreviations
" ========================================================================
iab @@ spencercdixon@gmail.com
iab adn and
iab que queue
iab teh the
iab iv I've
iab il I'll
iab monday Monday
iab tuesday Tuesday
iab wednesday Wednesday
iab thursday Thursday
iab friday Friday
iab saturday Saturday
iab sunday Sunday
iab *shrug* ¯\_(ツ)_/¯
iab fliptable （╯°□°）╯ ┻━┻

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

" convert md to markdown for syntax highlighting
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.md setf markdown

" convert CSS file types
au BufNewFile,BufRead *.styles setf css

" use better colorscheme for go programming
au BufNewFile,BufRead *.go colorscheme molokai

" In the quickfix window, <CR> is used to jump to the error under the" cursor,
" so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Put quickfix window ALWAYS at the bottom
autocmd FileType qf wincmd J

" Toggle relative numbers when switching panes
" augroup numbertoggle
  " autocmd!
  " autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  " autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" ========================================================================
" Custom Functions
" ========================================================================

function! ProseMode()
  " TODO: Change the color scheme to something nice for writing prose
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
endfunction

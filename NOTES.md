Misc Setup Tasks
* install homebrew (get curl command from github repo)
* install node via website

# Applications I want to have in every dev environment
brew cask install shiftit   # then add shiftit to sys accesibility prefs (requires sudo)  
brew cask install slack   
brew cask install macvim  
brew cask install evernote  
brew cask install spotify  
brew cask install dropbox  

# Brews
brew install chruby  
brew install ruby-install  
brew install the_silver_searcher  
brew install tree  
brew install mysql  
brew install v8-315  
brew link --force v8-315  

# Install common rubies
ruby-install ruby 2.1.5  
ruby-install ruby 2.2.0  
ruby-install ruby 2.3.0  
nvm install 5.1.0  
nvm install 5.3.0  
nvm install 5.10.0  

# Useful Links
* [relative line numbers](http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/)  
* [getting snippets and youcompleteme to work together](http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme)  
* [look into settin gup ctags](https://github.com/LaunchAcademy/vim-config/blob/4e54606e6e201612a7c2152eb190538166a8afc2/init/keybindings.vim#L80)  
* [could be cool plugin](https://github.com/easymotion/vim-easymotion)  

# Design Ideas
* separate plugin initializers into their own folder (vim/init)  
* have an alias that displays all aliases that are available with a description  
* store aliases in separate files inside an alias folder if they get too big  
* potentially store vundle/bundles in a vimrc.bundles and source it immediately in my main vimrc  
* echo a random alias every time I open vim or terminal until I have them all memorized  


Alias Types
* file system
* git helpers
* rake/rspec/npm helpers
* ns (npm start)

# Todo
* snippet integration
* make files/folders in dropbox for aliases:
* figure out how to install zshrc and rubies in command line

alias todos='mvim ~/Dropbox/docs/todos.md'  
alias shop='mvim ~/Dropbox/docs/shopping.md'  
alias bugs='mvim ~/Dropbox/docs/bug-journal.md'  
alias ='mvim ~/Dropbox/docs/bug-journal.md'  

# Leader Mapping Ideas
~space space - go back to last file~
~space - clear highlights (first need to figure out how to preserve highlights from searching)~

eslint
babel-eslint
eslint-config-airbnb
eslint@2.7
npm i eslint-plugin-jsx-a11y@^0.6.2 -g

# Commands To Learn

- vit - visual highlight text object
- daw - delete a word (repeatable with .)
- ctrl + a - increment number on cursor or next found num
- ctrl + x - decrement number on cursor or next found num
- ctrl + o - in insert mode lets us run normal command then re-enter insert.  'zz' is useful example to get better surrounding

Normal Mode
- <C-w>s - quicker split window
- <C-w>v - quicker vertical split
- <C-w>T - move current window into a new tab

Command Mode
- <C-p> - cycle through history of commands up
- <C-n> - cycle through history of commands down

Visual Mode
- <C-r>= in insert mode for calculations when in insert mode. 
- o will redefine the anchor of the visual selection

Settings
- set nrformats=    - treat all numbers as base 10

## Zsh related plugins
`node-docs` - brings up the api docs for the current version of node being used
`man-preview` - open up man docs in preview
`rc` - rails console
`rg` - rails generate
`rs` - rails server

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

# Taps
brew install chruby
brew install ruby-install
brew install the_silver_searcher
brew install tree

# Install common rubies
ruby-install ruby 2.1.5
ruby-install ruby 2.2.0
ruby-install ruby 2.3.0

# Useful Links
[relative line numbers](http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/)
[getting snippets and youcompleteme to work together](http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme)
[look into settin gup ctags](https://github.com/LaunchAcademy/vim-config/blob/4e54606e6e201612a7c2152eb190538166a8afc2/init/keybindings.vim#L80)

# Design Ideas
* separate plugin initializers into their own folder (vim/init)
* have an alias that displays all aliases
* store aliases in separate files inside an alias folder
* potentially store vundle/bundles in a vimrc.bundles and source it immediately in my main vimrc

Alias Types
* file system
* git helpers
* rake/rspec/npm helpers
* ns (npm start)

# Todo
* snippet integration
* make files/folders in dropbox for aliases:

alias todos='mvim ~/Dropbox/docs/todos.md'
alias shop='mvim ~/Dropbox/docs/shopping.md'
alias bugs='mvim ~/Dropbox/docs/bug-journal.md'
alias ='mvim ~/Dropbox/docs/bug-journal.md'


# Leader Mapping Ideas
space space - go back to last file
space - clear highlights (first need to figure out how to preserve highlights from searching)


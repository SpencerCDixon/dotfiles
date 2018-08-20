My dotfiles configuration.  Use at your own risk ;-)
=======
1.  [Installation](#installation)
2.  [Directory Structure](#directory-structure)
3.  [Leader Mappings](#leader-mappings)
5.  [Abbreviations](#abbreviations)
6.  [Functions](#functions)
7.  [Aliases](#aliases)

## Installation
```
git clone https://github.com/SpencerCDixon/dotfiles.git ~/.dotfiles
```

## Key Mappings
|Combo|Plugin|Description|
|-----|------|-----------|
|`,,`|vim|easy access to the shell `:!`|
|`,ev`|vim|edit vimrc file in split window|
|`,ea`|vim|edit aliases file in split window|
|`,et`|vim|edit todos file in split window|
|`,eb`|vim|edit bug journal file in split window|
|`,es`|UltiSnips|edit snippets for current file type|
|`,sv`|vim|source vimrc file|
|`,=`|vim|auto format an entire file|
|`,j`|vim|go to next tab|
|`,k`|vim|go to previous tab|
|`,as`|vim|alphabetically sort (in visual or normal)|
|`,pi`|Vundle|install all plugins|
|`,f`|ctrlP|search file system|
|`,\\`|NERDTree|open file tree|
|`,|`|NERDTree|go to current file in file tree|
|`  ` (space space)|vim|go to last file|
|` `(space )|vim|clear search highlight|
|`,a=`|vim|aligns equal signs|
|`,a:`|vim|aligns colons|
|`,af`|vim|aligns 'from's|
|`<C-l>`|UltiSnips|expand snippet|
|`<C-l>`|UltiSnips|go to next snippet section once expanded|
|`,tr`|Taboo|Rename current tab|
|`cmd + shift + c`|vim|copy current filepath to system clipboard (useful for specs)|
|`,v`|vim|split screen vertically|

## Useful Functions
`tre` - like 'tree' command but avoids directories I don't care about and adds nice colors  
`v` - opens macvim with current directory or given argument   
`mkd` - make directory and cd into it  
`mov2gif` - convert a .mov file from quicktime into a gif  

## Aliases
Running `aliases` in the terminal will open up all available aliases.  There are too many to write out in the readme.  The most important ones for configuring the dotfiles are below:

```
alias aliases='vim ~/.dotfiles/aliases'
alias zconfig='vim ~/.dotfiles/zshrc'
alias zfunc='vim ~/.dotfiles/functions'
alias vconfig='vim ~/.dotfiles/vimrc'
alias d='cd ~/.dotfiles'
alias reload='source ~/.zshrc'
```

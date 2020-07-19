# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh-custom

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# osx :                         add few commands for osx
# common-aliases                add few aliases
# alias-tips                    recommend alias for given command; ie. git status => gst. custom plugins at `github.com/djui/alias-tips`
# sudo                          press `esc` twice to prefix previous command with `sudo`
# z                             add `z` to jump to `frecency` used directories
# colored-man-pages             colorize man pages
# history                       add alias `h` for `history`
# httpie                        add completion for `http`
# fd                            add completion for `fd`

# extract			                  add function `extract` 

# brew                          add alias for `brew`

# git                           add alias `g` for `git`, and a whole lot more
# gitignore                     add command `gi` generate .gitignore file

# docker                        add completion for `docker`
# kubectl                       add alias `k` for `kubectl`, and a whole lot more
# helm                          add completion for `helm`

# jsontools                     add few commands for working with json. ex. pp_json can pretty print json file
# sbt                           add alias for `sbt`. ex. `sbc` for `sbt compile`. also add autocompletion for `sbt`

plugins=(
  osx
  common-aliases
  alias-tips
  sudo
  z
  colored-man-pages
  history
  httpie
  fd

  extract

  brew

  git
  gitignore

  docker
  kubectl
  helm

  jsontools
  sbt
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Customization

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

# Enabling Syntax Highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias dotfiles-public="/usr/bin/git --git-dir=$HOME/.dotfiles-public.git/ --work-tree=$HOME"

# Unalias these alias from `common-aliases` plugins and use `/usr/local/bin/fd` instead
unalias fd
unalias ff

# Hook direnv into zsh
eval "$(direnv hook zsh)"

# Activate `command-not-found` terminal prompt
if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)"; fi

# load `nvm` command and completion
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

# Add gcloud (google-cloud-sdk) to PATH and add gcloud completion.
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Configure Language and Locale for gcloud
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Activate jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# I currently work on a project which specificly require postgres 9.6
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# get macOS Software Update, and upgrade everything else on brew & brew cask.
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cask upgrade; brew cleanup'

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Pipe this after a long task to notify when it's done 
alias notify="terminal-notifier -sound default"

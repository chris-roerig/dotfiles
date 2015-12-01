# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
#ZSH_THEME="sonicradish"
ZSH_THEME='arrow'

# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails ruby wd)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.bin" # custom scripts

alias co="checkout"
alias edoc="vim ~/Documents/Docs/index.html"
alias gpull="git checkout master && git pull origin master && rake doc:app"
alias ctags="`brew --prefix`/bin/ctags"
alias again="clear && !!"
alias e='exit'
alias c='clear'
alias cim='vim'
alias lsls='ls -la'
alias ssource='source ~/.zshrc'
alias ggs='clear && git status'
alias ggb='clear && git branch'
alias ggl='clear && git log'
alias migrate='rake db:migrate'
alias seed='rake db:seed'
alias hist='history | grep'
alias cop='rubocop'
alias copp='rubocop -f offenses'
alias copa='rubocop -a'
alias be='bundle exec'
alias ber='bundle exec rake'
alias sidek='be sidekiq'
alias glas='git checkout -'
alias killthin='kill $(lsof -i :3000 -t)'
alias tlog='tail -F log/development.log'

function ggc {
  git commit -m $1
}

function ggd {
  git diff $1
}

function master {
  git checkout master
}

function gfind {
  grep --exclude='./coverage/*' --exclude='*/tmp/*' --exclude='*.log' --exclude='./doc/*' --exclude='*/.tags/*' $1 . -R -n
}

function rollback {
  rake db:rollback STEP=$1
}

function killmysql {
  pids=($(ps -ef | grep mysql | awk '{print $2}'))
  for i in "${pids[@]}"
  do
     :
    eval "kill -9 $i"
  done
}

function killruby {
  pids=($(ps -ef | grep ruby | awk '{print $2}'))
  for i in "${pids[@]}"
  do
     :
    eval "kill -9 $i"
  done
}

function rubogit {
  mfiles=($(git ls-files -m | grep .rb))
  for var in "$mfiles[@]"
  do
      :
    if [ "${var}" = "db/schema.rb" ]
    then
        continue
    else
      echo "\n\n"
      rubocop "${var}"
    fi
  done
}

function gitpush {
  branch=$(git rev-parse --abbrev-ref HEAD)
}

# thanks http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# for grubbox vim colorscheme
# ~/.vim/bundle/gruvbox/gruvbox_256palette.sh
source ~/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh
[[ "$TERM" == "xterm" ]] && export TERM=xterm-<t_Co>color

# Add this to ~/.profile to get 256 color support
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

[ -f .zshrc_private ] && source .zshrc_private
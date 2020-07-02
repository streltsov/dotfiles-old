# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="lambda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

autoload -Uz compinit promptinit
compinit
promptinit

export EDITOR="/usr/bin/vim"
export QT_QPA_PLATFORMTHEME=qt5ct

PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

#Vi style
#set -o vi
bindkey -v
export KEYTIMEOUT=1

alias ls='ls -1 --color=auto'
alias rmorphans='sudo pacman -Rns $(pacman -Qtdq)'
alias fbtofbzip="find . -name '*.fb2' -print -exec zip '{}'.zip '{}' \; -exec rm '{}' \;"
alias webcam='mpv av://v4l2:/dev/video0'
alias wlp='sudo ip link set wlp4s0 up'
alias wlpdown='sudo ip link set wlp4s0 down'
alias wifi-menu='sudo wifi-menu'
alias backlight='sudo vim /sys/class/backlight/amdgpu_bl0/brightness'
alias myip='curl smart-ip.net/myip'
alias allapps='comm -23 <(pacman -Qeq | sort) <(pacman -Sqg base base-devel xorg | sort)'
alias mkpass='</dev/urandom tr -dc "0123456789qwertyuiopasdfghjklzxcvbnm!@#$%^&*()QWERTYUIOPASDFGHJKLZXCVBNM" | head -c48; echo ""'
alias chmac='wlpdown && sudo macchanger -A wlp4s0 && wlp'
alias crackemall='wlpdown && sudo macchanger -A wlp4s0 && wlp && sudo airmon-ng start wlp4s0 && sudo wlandump-ng -D -s -i wlp4s0mon -o capture.cap && sudo airmon-ng stop wlp4s0mon && echo MONITOR MODE IS OFF!'
alias dumpemall='sudo airmon-ng start wlp4s0 && sudo airodump-ng wlp4s0mon && sudo airmon-ng stop wlp4s0mon && echo MONITOR MODE IS OFF!'
alias mountfa='sudo mount -t vfat -ouser,umask=0000'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias myip='curl –s https://icanhazip.com'
alias chillmeup='mpv --no-video https://www.youtube.com/watch\?v\=5qap5aO4i9A --volume=40'

#export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

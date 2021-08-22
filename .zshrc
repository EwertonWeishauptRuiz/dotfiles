# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

################################################################################
#                              THEME                                           #
################################################################################

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-{zsh/wiki/Themes
ZSH_THEME="candy"
# ZSH_THEME="spaceship"

if [ $ZSH_THEME = "spaceship" ]; then
  SPACESHIP_CHAR_SYMBOL="$ "
  SPACESHIP_CHAR_SYMBOL_ROOT="# "
  SPACESHIP_USER_SHOW=always
  SPACESHIP_HOST_SHOW=always
fi


################################################################################
#                              DEFAULT OH MY ZSH                               #
################################################################################

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

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
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/dotfiles/zsh.custom

################################################################################
#                              PLUGINS                                         #
################################################################################
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


plugins=(
    git
    wd
    docker
	)
#wakatime)

source $ZSH/oh-my-zsh.sh

# User configuration
################################################################################
#                              MISC                                            #
################################################################################

# Awful way to determine if this is a VM and I should connect to host X11
if [ -f ~/this-is-a-vm ]; then
  export DISPLAY=10.0.0.1:0.0
fi

if [ -f ~/using-rvm ]; then
  # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
  export PATH="$PATH:$HOME/.rvm/bin"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
fi

if [ -f ~/using-rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

export VISUAL=vim
export EDITOR="$VISUAL"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$PATH:$HOME/.local/bin"


# Set fzf installation directory path
export FZF_BASE=/path/to/fzf/install/dir

# Uncomment the following line to disable fuzzy completion
# export DISABLE_FZF_AUTO_COMPLETION="true"

# Uncomment the following line to disable key bindings (CTRL-T, CTRL-R, ALT-C)
# export DISABLE_FZF_KEY_BINDINGS="true"

plugins=(
  ...
  fzf
)

eval $(keychain --eval id_rsa)
################################################################################
#                              ALIAS                                           #
################################################################################

alias startx="xinit ~/.xinitrc $2"
alias rds_dump="pg_dump -h antonov.mobbiz.com.br -U gigaservices -F c -v"
alias easy_restore="pg_restore -h 127.0.0.1 -U postgres -x -c -v -O -d "
alias abnt2="setxkbmap -model abnt2 -layout br -variant abnt2"
alias lock="xscreensaver-command -lock"
alias suspend='systemctl suspend'
alias startvpn='systemctl start expressvpn.service'
alias vpnitaly='expressvpn connect Italy'
alias vpnbrazil='expressvpn connect Brazil'
alias vpndisconnect='expressvpn disconnect'
eval $(thefuck --alias)
alias be="bundle exec"
alias zrdm="zeus rake db:migrate && zeus rake db:test:prepare"
alias service-docker="systemctl start docker.service"
alias docker-go="docker start postgres dev-django ;docker attach dev-django"						     
alias develop='git checkout develop'
alias pull-develop='git pull intempus develop'
alias cd-intempus='wd intempus'
alias ssh-intempus-key='ssh-add /home/shakamaiden/.ssh/home'
alias clean-python-pyc='sudo find . -name "*.pyc" -exec rm -f {} \;'
alias find-py-tilde='sudo find . -name "*.py~" -type f'
alias delete-py-tilde='sudo find . -name "*.py~" -type f -delete'
alias delete-pyc="find . -name '*.pyc' -delete"
alias clean-python-project='delete-pyc ; delete-py-tilde'
alias show-docker-containers='docker container ls -a'
alias docker-bash='docker exec -it dev-django bash '
alias caps-to-control='./caps-to-control.sh'
alias proxy-me='cd ~/.ssh && ./proxy.sh'
alias ipy='ipython'
alias weather-copenhagen='curl https://wttr.in/Copenhagen'
alias ssh-intempus='ssh-add /home/shakamaiden/.ssh/home' 
alias connect-spt='sudo --preserve-env=SSH_AUTH_SOCK ssh -L 81.7.168.171:443:81.7.168.171:443 root@apitest-integration.intempus.dk'
alias emch-proxy='sudo --preserve-env=SSH_AUTH_SOCK ssh -L 40.118.103.203:443:40.118.103.203:443  root@integration.intempus.dk'
alias lindved-proxy='sudo --preserve-env=SSH_AUTH_SOCK ssh -L 51.124.33.52:443:51.124.33.52:443  root@integration.intempus.dk'



# export TERMINAL=alacritty

<<<<<<< Updated upstream
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Start a wayland gnome session
alias way_of_gnome="QT_QPA_PLATFORM=wayland XDG_SESSION_TYPE=wayland dbus-run-session gnome-session"

# if [[ "$(tty)" == '/dev/tty1' ]]; then
#   xinit ~/.xinitrc i3
# fi

if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi
=======
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [["$(tty)" == '/dev/tty1']]; then
    xinit ~/.xinitrc i3
    fi

wd() {
     . ~/wd/wd.sh
 }
fpath=(~/path/to/wd $fpath)
>>>>>>> Stashed changes


echo "\nHigh five!!\n"


platform=$(uname)
export ZSH=~/.oh-my-zsh
export TERM="xterm-256color"
export VISUAL="vim"

export QT_AUTO_SCREEN_SCALE_FACTOR=1

# For tmuxp
export DISABLE_AUTO_TITLE='true'

# Increase available heap to better handle symsim (sbt) 
export SBT_OPTS="-Xmx3G -XX:+UseG1GC -Xss2M"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="refined"

# Hide machine name in theme (for agnoster theme)
DEFAULT_USER="$(whoami)"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode colored-man-pages pip tmux sudo z)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# alias ipython="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias python="python3"
alias py="python3"
# alias pip="pip3"

# Config updates
alias vz="vim ~/.zshrc"
alias sz="source ~/.zshrc"

# Tmux
alias tn="tmux new -s"
alias tnn="tmux new"
alias ta="tmux at -t"
alias try="tmux resize-pane -y"
alias trx="tmux resize-pane -x"

# F# stuff
alias fsi="fsharpi"
alias fsc="fsharpc"

# Networking
alias connup="nmcli connection up"
alias hotspot="nmcli connection up iPhone\ \(2\)"

# FZF
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{*/node_modules/*,.git/*,*/__pycache__/*,*/build/*}"'

export CLASSPATH=$CLASSPATH:~/algs4/algs4.jar:~/java/junit.jar:~/java/javabdd-1.0b2.jar
if [[ $platform == 'Linux' ]]; then
    # Exports
    export PATH=/usr/local/bin:$HOME/bin:$PATH

    # Aliases
    # Modify keyboard backlight
    alias kbo="sudo keyboard_backlight.sh off"
    alias kbu="sudo keyboard_backlight.sh up"
    alias kbd="sudo keyboard_backlight.sh down"
elif [[ $platform == 'Darwin' ]]; then
    # Exports
    export PATH=/usr/local/bin:/usr/local/mysql/bin:/Library/TeX/texbin/:$PATH

    # Aliases
    alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc"

    # heroku autocomplete setup
    HEROKU_AC_ZSH_SETUP_PATH=/Users/andreashhp/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

fi

# needed for virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
source /usr/local/bin/virtualenvwrapper.sh

# Speed up compilation time of C/C++ source code
export HOMEBREW_MAKE_JOBS=4

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/andreashhp/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/andreashhp/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/andreashhp/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/andreashhp/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

fpath+=${ZDOTDIR:-~}/.zsh_functions

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

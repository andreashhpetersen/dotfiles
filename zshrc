
echo "\nHigh five!!\n"


platform=$(uname)
export ZSH=~/.oh-my-zsh
export TERM="xterm-256color"
export VISUAL="vim"

export QT_AUTO_SCREEN_SCALE_FACTOR=1

# For tmuxp
export DISABLE_AUTO_TITLE='true'

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
plugins=(git vi-mode colored-man-pages pip tmux sudo django z)

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

alias ipython="ipython3"
alias pip="pip3"
alias py="python3"

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

export CLASSPATH=$CLASSPATH:~/algs4/algs4.jar:~/java/junit.jar:~/java/javabdd-1.0b2.jar
if [[ $platform == 'Linux' ]]; then
    # Exports
    export PATH=/usr/local/bin:$HOME/bin:$PATH
    export VIRTUALENVWRAPPER_LOCATION=/usr/bin

    # Aliases
    # Modify keyboard backlight
    alias kbo="sudo keyboard_backlight.sh off"
    alias kbu="sudo keyboard_backlight.sh up"
    alias kbd="sudo keyboard_backlight.sh down"
elif [[ $platform == 'Darwin' ]]; then
    # Exports
    export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:/usr/local/bin:$PATH:User/andreashhp/miniconda2/bin:/usr/local/mysql/bin:/Library/TeX/texbin/
    export VIRTUALENVWRAPPER_LOCATION=/usr/local/bin

    # Aliases
    alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc"

    # heroku autocomplete setup
    HEROKU_AC_ZSH_SETUP_PATH=/Users/andreashhp/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

fi

# needed for virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
source $VIRTUALENVWRAPPER_LOCATION/virtualenvwrapper.sh

# Speed up compilation time of C/C++ source code
export HOMEBREW_MAKE_JOBS=4


# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/andreaspetersen/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

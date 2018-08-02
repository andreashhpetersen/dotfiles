export ZSH=/Users/andreashhp/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode colored-man-pages pip3 brew z)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias ipython="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

export CLASSPATH=$CLASSPATH:~/algs4/algs4.jar:~/java/junit.jar:~/java/junit.jar
export PATH=$PATH:User/andreashhp/miniconda2/bin:/usr/local/bin:/usr/local/mysql/bin:/Library/TeX/texbin/

# needed for virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

# Make use of nice bd command
# see https://github.com/vigneshwaranr/bd
alias bd=". bd -si"

# Speed up compilation time of C/C++ source code
export HOMEBREW_MAKE_JOBS=4



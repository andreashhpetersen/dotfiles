# python path
export PATH=/usr/local/bin:$PATH:/usr/local/mysql/bin

# needed for virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

alias bd=". bd -si"
alias tv='tidy-viewer'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/andreashhp/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/andreashhp/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/andreashhp/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/andreashhp/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/andreashhp/.sdkman"
[[ -s "/home/andreashhp/.sdkman/bin/sdkman-init.sh" ]] && source "/home/andreashhp/.sdkman/bin/sdkman-init.sh"

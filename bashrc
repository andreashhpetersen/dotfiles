# python path
export PATH=/usr/local/bin:$PATH:/usr/local/mysql/bin

# virtualenvwrapper - source it from wherever it landed, stay quiet if absent
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$(command -v python3)
for _vew in \
    "$HOME/.local/bin/virtualenvwrapper.sh" \
    /usr/local/bin/virtualenvwrapper.sh \
    /usr/share/virtualenvwrapper/virtualenvwrapper.sh \
    /opt/homebrew/bin/virtualenvwrapper.sh
do
    [ -f "$_vew" ] && source "$_vew" && break
done
unset _vew

alias bd=". bd -si"
alias tv='tidy-viewer'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

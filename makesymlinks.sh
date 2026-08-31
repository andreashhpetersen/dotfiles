#!/bin/bash
#
# Symlink the tracked dotfiles into $HOME and bootstrap the vim/tmux plugin
# managers. Assumes the repo is at ~/dotfiles and that zsh + oh-my-zsh are
# already installed.

set -e

dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc vimrc vim zshrc tmux.conf"

mkdir -p "$olddir"

for f in $files; do
    # back up a real file/dir, but never an existing symlink (idempotent re-runs)
    if [ -e "$HOME/.$f" ] && [ ! -L "$HOME/.$f" ]; then
        echo "backup  ~/.$f -> $olddir/"
        mv "$HOME/.$f" "$olddir/"
    fi
    ln -sfn "$dir/$f" "$HOME/.$f"
    echo "link    ~/.$f"
done

# vim-plug (vim/autoload is gitignored)
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    echo "install vim-plug"
    curl -fsSLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# tpm (tmux plugin manager)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "install tpm"
    git clone -q https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

cat <<'EOF'

Done. Remaining manual steps:
  vim +PlugInstall +qall
  vim: :LspInstallServer in a file of each language you use
  tmux, then <prefix> + I                          # install tmux plugins
  chsh -s "$(command -v zsh)"                      # if zsh isn't your shell yet
EOF

# dotfiles

Personal dotfiles. Used on two machines:

- an X11 / i3 box (`config/i3`, `config/polybar`, `Xresources`, `urxvt`)
- a Wayland / niri box (niri configured directly on that machine, not tracked here)

The shared configs (`zshrc`, `bashrc`, `vimrc`, `tmux.conf`) detect the
session type at runtime, so the same files work under both.

## Install

```sh
git clone <this repo> ~/dotfiles
cd ~/dotfiles
git submodule update --init --recursive
./makesymlinks.sh
```

Then in vim run `:PlugInstall`, and in tmux press `prefix + I` to install plugins.

## Packages to install on a fresh machine

Common:

```sh
sudo apt install zsh tmux vim-gtk3 ripgrep fzf bat virtualenvwrapper \
    zathura build-essential cmake python3-dev curl
```

- `vim-gtk3` - vim with `+clipboard` / `+wayland` (plain `vim` has neither)
- `ripgrep` - backs `FZF_DEFAULT_COMMAND`
- `bat` - aliased to `cat` (binary is `batcat` on Ubuntu)
- `virtualenvwrapper` - preferred env manager (no conda)
- `build-essential cmake python3-dev` - for YouCompleteMe's `install.py`

Wayland / niri box also needs:

```sh
sudo apt install wl-clipboard xwayland-satellite
```

- `wl-clipboard` - `wl-copy`/`wl-paste`, used by tmux-yank and the vimrc clipboard fallback
- `xwayland-satellite` - X11 app support under niri

niri has no bar/launcher/notifier of its own; install e.g. `waybar`,
`fuzzel`, `mako` separately.

Other tooling: `oh-my-zsh` (installed by `makesymlinks.sh`), `nvm`, `sdkman`,
`ghcup`, Copilot (`:Copilot setup`, needs node).

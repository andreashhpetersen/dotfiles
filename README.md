# dotfiles

Personal dotfiles. Used on two machines:

- an X11 / i3 box (`config/i3`, `config/polybar`, `Xresources`, `urxvt`)
- a Wayland / niri box (niri configured directly on that machine, not tracked here)

The shared configs (`zshrc`, `bashrc`, `vimrc`, `tmux.conf`) detect the
session type at runtime, so the same files work under both.

## Install

Prerequisite: `zsh` + `oh-my-zsh` already installed.

```sh
git clone <this repo> ~/dotfiles
cd ~/dotfiles
./makesymlinks.sh
```

`makesymlinks.sh` symlinks the shared configs, bootstraps vim-plug and tpm,
and prints the remaining manual steps (`:PlugInstall`, `prefix + I`,
`:LspInstallServer`, `chsh`).

## Packages to install on a fresh machine

Common:

```sh
sudo apt install zsh tmux vim-gtk3 ripgrep fzf bat virtualenvwrapper \
    zathura python3-pip nodejs npm curl git
```

- `vim-gtk3` - vim with `+clipboard` / `+wayland` (plain `vim` has neither)
- `ripgrep` - backs `FZF_DEFAULT_COMMAND`
- `bat` - aliased to `cat` (binary is `batcat` on Ubuntu)
- `virtualenvwrapper` - preferred env manager (no conda)
- `python3-pip nodejs npm` - vim-lsp-settings uses these to install language servers

Wayland / niri box also needs:

```sh
sudo apt install wl-clipboard xwayland-satellite
```

- `wl-clipboard` - `wl-copy`/`wl-paste`, used by tmux-yank and the vimrc clipboard fallback
- `xwayland-satellite` - X11 app support under niri

niri has no bar/launcher/notifier of its own; install e.g. `waybar`,
`fuzzel`, `mako` separately.

In vim, run `:LspInstallServer` once in a file of each language you use
(needs `python3-pip` / `npm`).

Other tooling as needed: `nvm`, `sdkman`, `ghcup`.

## vim: LSP keybindings

Completion (asyncomplete) pops up while typing: `<Tab>` / `<S-Tab>` to move,
`<C-y>` to confirm, `<C-e>` to cancel. Snippets (UltiSnips) expand/jump on
`<C-j>` / `<C-k>`.

In a buffer with a running language server:

| key | action |
|-----|--------|
| `<C-]>` | go to definition |
| `<C-w><C-]>` | definition in a split |
| `<leader>k` | hover docs |
| `<leader>rn` | rename symbol |
| `<leader>rf` | find references |

`<leader>` is `,`. Diagnostics come from ALE, not vim-lsp — jump between
them with `]a` / `[a`. Servers are managed with `:LspInstallServer` /
`:LspManageServers`.

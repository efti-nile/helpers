# helpers

## CLI configs

- `.zshrc` is the configuration file for the Zsh shell.
- `.vimrc` is the configuration file for the Vim text editor.
- `.tmux.conf` is the configuration file for the Tmux terminal multiplexer.
- `aliases.sh` sets aliases.

## `infection.sh`

This script installs the necessary tools and configurations for a newly created Ubuntu or Debian server. The following environment variables can be set:

- `NEW_USER`: name for the new user (default: ft)
- `INSTALL_DOCKER`: if set, Docker will be installed
- `INSTALL_XFCE`:   if set, Xfce will be installed
- `INSTALL_VNC`:    if set, a VNC server will be installed and set up

Use:

```bash
wget https://github.com/efti-nile/helpers/raw/main/infection.sh
chmod +x infection.sh
NEW_USER=Jhon INSTALL_DOCKER=1 source infection.sh
```

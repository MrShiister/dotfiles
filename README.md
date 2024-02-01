# dotfiles
All personal configuration files

# Onboard a new machine

Bug: Setup works for devcontainers but not for new machines

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init mrshiister &&
~/.local/share/chezmoi/install.sh
```

- `install.sh` fails because the `.oh-my-zsh` plugins and themes get cloned first, resulting in "omz already installed" error
- workaround by temporarily moving `.oh-my-zsh` directory before install

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/MrShiister/dotfiles/main/install.sh)"
```

- fails because `script_dir` is `/usr/bin`
- no repo cloned yet
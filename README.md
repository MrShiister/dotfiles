# dotfiles
All personal configuration files

# Onboard a new machine

## Prereqs

- `curl`

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply mrshiister
```

Optionally, change the default shell to `zsh`.

```bash
chsh -s /bin/zsh $USER
```
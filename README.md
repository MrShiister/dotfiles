# dotfiles
All personal configuration files

# Onboard a new machine

## Prereqs

- `curl`

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply mrshiister
```
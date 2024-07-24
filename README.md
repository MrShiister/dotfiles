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

## WSL

Install Gpg4win to get `pinentry-basic.exe` so that your GPG key passphrase can be entered during signing of commit inside a devcontainer.

## Non-devcontainer Linux

Before creating devcontainers,

1. Generate [new GPG keys](https://github.com/settings/keys) and add them to GitHub.
1. `chezmoi edit-config` and add the key ID.
1. `chezmoi apply --dry-run` to check, then apply.
1. `gh auth login` to cache GitHub credentials.

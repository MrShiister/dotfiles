# dotfiles

All personal configuration files

# Onboard a new machine

## Prompt Options

The installation script allows option to install GitHub's gh cli, and the Devpod cli.

Do one of the following:

1. Leave the `--promptDefaults` flag on, which evaluates to true for all options.
1. Remove the `--promptDefaults` flag, and be prompted during installation (1, on, t, true, y, yes / 0, off, f, false, n, no).
1. Replace `--promptDefaults` with the following, choosing between true/false):

   ```bash
   `--promptBool "Install gh cli"=false,"Install devpod cli"=false`
   ```

## Prereqs

- `curl`

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply mrshiister --promptDefaults
```

Optionally, change the default shell to `zsh`.

```bash
sudo chsh -s /bin/zsh $USER
```

## WSL

Install Gpg4win to get `pinentry-basic.exe` so that your GPG key passphrase can be entered during signing of commit inside a devcontainer.

## Non-devcontainer Linux

Before creating devcontainers,

1. Generate [new GPG keys](https://github.com/settings/keys) and add them to GitHub.
1. `chezmoi edit-config` and add the key ID.
1. `chezmoi apply --dry-run` to check, then apply.
1. `gh auth login` to cache GitHub credentials.


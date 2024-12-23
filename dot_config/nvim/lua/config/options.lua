-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Revert the paste functionality to the original
local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

-- This section provides clipboard access through WSL/remote VMs in and outside of containers
-- Assumes WSL is your local environment, and devpod with ssh provider for remote devcontainer.
--
-- 1. install socat on both your WSL and endpoint
-- 2. choose an arbitrary port (here 8121. replace all 8121 with your chosen port)
-- 3a. if only using local devcontainers,
--     1. find the docker network range with `ip route show` in your WSL (most likely 172.17.0.0/16)
--     2. run on a new WSL shell:
--          socat tcp-listen:8121,fork,range=172.17.0.0/16 EXEC:'clip.exe'
-- 3b. if using remote VM or remote devcontainers,
--     1. add `RemoteForward 8121 localhost:8121` in `.ssh/config` to your remote machine or container
--     2. run on a new WSL shell:
--          socat tcp-listen:8121,fork,bind=0.0.0.0 EXEC:'clip.exe'
--
-- TODO: don't set vim.g.clipboard when host machine is not using WSL.

-- Always use clipboard
vim.opt.clipboard = "unnamedplus"

-- Check that the current machine is on WSL
if vim.fn.has("wsl") == 1 then
  -- If you are in a devcontainer, access the clipboard by forwarding to localhost
  if vim.env.REMOTE_CONTAINERS then
    vim.g.clipboard = {
      name = "WSLContainerClipboard",
      copy = {
        ["+"] = "socat - tcp:172.17.0.1:8121",
        ["*"] = "socat - tcp:172.17.0.1:8121",
      },
      paste = {
        ["+"] = paste,
        ["*"] = paste,
      },
      cache_enabled = 0,
    }
  else
    -- If not in a devcontainer, access the clipboard directly
    vim.g.clipboard = {
      name = "WslClipboard",
      copy = {
        ["+"] = "clip.exe",
        ["*"] = "clip.exe",
      },
      paste = {
        ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      },
      cache_enabled = 0,
    }
  end
else
  -- If you are in a remote machine, access the clipboard through the RemoteForward configuration.
  vim.g.clipboard = {
    name = "RemoteClipboard",
    copy = {
      ["+"] = "socat - tcp:127.0.0.1:8121",
      ["*"] = "socat - tcp:127.0.0.1:8121",
    },
    paste = {
      ["+"] = paste,
      ["*"] = paste,
    },
    cache_enabled = 0,
  }
end

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

if vim.fn.has("wsl") == 1 then
  if vim.env.REMOTE_CONTAINERS then
    -- 1. install socat on both host and container
    -- 2. set range to the docker network `ip route show`
    -- 3. choose an arbitrary port
    -- 4. run on your host:
    --    socat tcp-listen:8121,fork,range=172.17.0.0/16 EXEC:'clip.exe'
    vim.g.clipboard = {
      name = "ContainerInWslClipboard",
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
end

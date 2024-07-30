local function getSize()
  local winwidth = vim.go.columns
  if winwidth <= 100 then
    return 30
  elseif winwidth <= 200 then
    return 40
  else
    return 100
  end
end

return {
  "folke/trouble.nvim",
  opts = {
    win = {
      type = "split",
      relative = "win",
      size = getSize(),
      position = "left", -- didn't work
    },
  },
}

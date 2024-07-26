return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    labels = "aoeuhtnspyfgcrlqjkxbmwvz",
  },
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, false },
    { "S", mode = { "n", "x", "o" }, false },
    { "gs", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "gS", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
}

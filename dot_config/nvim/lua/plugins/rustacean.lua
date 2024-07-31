return {
  "mrcjkb/rustaceanvim",
  -- dependencies = {
  --   { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
  -- },
  opts = {
    server = {
      default_settings = {
        ["rust-analyzer"] = {},
      },
    },
  },
}

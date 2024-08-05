return {
  "mrcjkb/rustaceanvim",
  -- dependencies = {
  --   { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
  -- },
  opts = {
    server = {
      default_settings = {
        ["rust-analyzer"] = {
          cargo = {
            -- target = "wasm32-wasip1",
            -- allFeatures = true,
            -- extraEnv = {
            --   ["RUSTFLAGS"] = "--cfg tokio_unstable",
            -- },
          },
          check = {},
        },
      },
      load_vscode_settings = true,
    },
  },
}

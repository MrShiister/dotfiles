return {

  {
    "mfussenegger/nvim-dap",

    -- stylua: ignore
    keys = {
      { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<F5>", function() require("dap").continue() end, desc = "Continue" },
      { "<F11>", function() require("dap").step_into() end, desc = "Step Into" },
      { "<S-F11>", function() require("dap").step_out() end, desc = "Step Out" },
      { "<F10>", function() require("dap").step_over() end, desc = "Step Over" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    -- dependencies = {
    --   { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    -- },
    opts = {
      setup = {
        -- Don't use nvim-lspconfig for rust as rustaceanvim is preferred
        rust_analyzer = function()
          return true
        end,
      },
    },
  },

  {
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
  },
}

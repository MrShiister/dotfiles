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
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- esbonio will be automatically installed with mason and loaded with lspconfig
        esbonio = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
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

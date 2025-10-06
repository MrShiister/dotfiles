return {

  {
    "mfussenegger/nvim-dap",

    -- stylua: ignore
    keys = {
      { "<F9>",    function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<F5>",    function() require("dap").continue() end,          desc = "Continue" },
      { "<F11>",   function() require("dap").step_into() end,         desc = "Step Into" },
      { "<S-F11>", function() require("dap").step_out() end,          desc = "Step Out" },
      { "<F10>",   function() require("dap").step_over() end,         desc = "Step Over" },
    },

    opts = function()
      local dap = require("dap")
      dap.defaults.codelldb.exception_breakpoints = { "rust_panic" }
    end,
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-debug-adapter",
        "bash-language-server",
        "clang-format",
        "clangd",
        "cpptools",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "esbonio",
        "groovy-language-server",
        "rust-analyzer",
        "typescript-language-server",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- servers = {
      --   -- rst
      --   esbonio = {},
      --
      --   -- javascript, typescript
      --   ts_ls = {},
      --
      --   -- rust
      --   rust_analyzer = {},
      --
      --   -- docker
      --   dockerls = {},
      --   docker_compose_language_service = {},
      --
      --   -- ltex-ls-plus
      --   ["ltex_plus"] = {
      --     settings = {
      --       ltex = {
      --         language = "en-GB",
      --         enabled = { "restructuredtext" },
      --       },
      --     },
      --   },
      -- },

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
    ---@class PluginLspOpts
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

  {
    "stevearc/conform.nvim",
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        groovy = { "npm-groovy-lint" },
      },
      timeout_ms = 4000,
    },
  },

  {
    -- Set up the following env in a .tmp file:
    --   export JENKINS_USER_ID=...
    --   export JENKINS_URL=https://...
    --   export JENKINS_PASSWORD=...
    -- then execute '. ./tmp' before running nvim.
    -- Call 'lua require("jenkinsfile_linter").validate()' in a Jenkinsfile.
    "ckipp01/nvim-jenkinsfile-linter",
    requires = { "nvim-lua/plenary.nvim" },
  },
}

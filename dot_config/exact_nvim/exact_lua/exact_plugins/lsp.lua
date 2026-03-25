return {

  {
    "folke/lazydev.nvim",
    ft = "lua",
    ---@alias lazydev.Library {path:string, words:string[], mods:string[]}
    ---@alias lazydev.Library.spec string|{path:string, words?:string[], mods?:string[]}
    ---@class lazydev.Config
    opts = {
      ---@type lazydev.Library.spec[]
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "LazyVim", words = { "LazyVim" } },
        { path = "snacks.nvim", words = { "Snacks" } },
        { path = "lazy.nvim", words = { "LazyVim" } },
        { path = "nvim-lspconfig", words = { "lspconfig.settings" } },
      },
    },
  },

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
      ---@type table<string, lazyvim.lsp.Config|boolean>
      servers = {
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
        -- lua_ls
        lua_ls = {
          ---@type lspconfig.settings.lua_ls
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
      },

      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:vim.lsp.Config):boolean?>
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
          ---@type _.lspconfig.settings.rust_analyzer.RustAnalyzer
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
    ---@module "conform"
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

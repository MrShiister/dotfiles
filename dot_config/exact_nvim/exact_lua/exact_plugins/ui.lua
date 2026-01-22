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
  -- DiffviewOpen <commit>
  --
  -- To see branch diffs without diffview,
  -- - Gitsigns change_base <commit>
  -- - Neotree <commit>
  --
  -- DiffviewOpen crashed on merge state between two repos of unrelated histories.
  -- Apply diffview.nvim.diff for workaround.
  {
    "sindrets/diffview.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>dvo", "<cmd>DiffviewOpen<cr>",          desc = "Open Diffview" },
      { "<leader>dvc", "<cmd>DiffviewClose<cr>",         desc = "Close Diffview" },
      { "<leader>dvf", "<cmd>DiffviewFileHistory %<cr>", desc = "Open Diffview of this file's history" },
      {
        "<leader>dvv",
        function()
          vim.ui.input({ prompt = "Arguments to Diffview: " }, function(input)
            local args = {}
            local i = 1
            for token in input.gmatch(input, "[%S]+") do
              args[i] = token
              i = i + 1
            end
            require("diffview").open(args)
          end)
        end,
        desc = "Open Diffview with arguments"
      }
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = false,
    ---@type Flash.Config
    opts = {
      labels = "aoeuhtnspyfgcrlqjkxbmwvz",
    },
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, false },
      { "S",     mode = { "n", "x", "o" }, false },
      { "gs",    mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "gS",    mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "macchiato",
      transparent_background = true,
    },
  },

  {
    "folke/snacks.nvim",
    ---@module "snacks"
    ---@type snacks.Config
    opts = {
      notifier = {
        style = "minimal",
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      filesystem = {
        bind_to_cwd = true,
        filtered_items = {
          visible = true,
        },
      },
    },
  },

  {
    "folke/trouble.nvim",
    opts = {
      win = {
        type = "split",
        relative = "win",
        size = getSize(),
        position = "left", -- didn't work
      },
    },
  },

  {
    "rcarriga/nvim-notify",
  },

  {
    "ibhagwan/fzf-lua",
    opts = function()
      local config = require("fzf-lua.config")
      config.defaults.keymap.fzf["ctrl-b"] = "half-page-up"
      config.defaults.keymap.fzf["ctrl-f"] = "half-page-down"
      config.defaults.keymap.fzf["ctrl-d"] = "preview-page-down"
      config.defaults.keymap.fzf["ctrl-u"] = "preview-page-up"
      config.defaults.keymap.builtin["<c-d>"] = "preview-page-down"
      config.defaults.keymap.builtin["<c-u>"] = "preview-page-up"
      config.defaults.keymap.builtin["<c-f>"] = false
      config.defaults.keymap.builtin["<c-b>"] = false
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "OXY2DEV/markview.nvim" },
    lazy = false,
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    -- load after nvim-treesitter
    -- https://github.com/OXY2DEV/markview.nvim/issues/365#issuecomment-3028249737
    priority = 49,
  },
}

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
  {
    "sindrets/diffview.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>dvo", "<cmd>DiffviewOpen<cr>",  desc = "Open Diffview" },
      { "<leader>dvc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      labels = "aoeuhtnspyfgcrlqjkxbmwvz",
    },
    -- stylua: ignore
    keys = {
      { "s",  mode = { "n", "x", "o" }, false },
      { "S",  mode = { "n", "x", "o" }, false },
      { "gs", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "gS", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },

  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      notifier = {
        style = "minimal",
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        grep_string = {
          additional_args = { "--hidden", "--glob", "!.git" },
        },
        live_grep = {
          additional_args = { "--hidden", "--glob", "!.git" },
        },
        -- Press Alt-i inside Telescope for no_ignore
        -- https://www.lazyvim.org/extras/editor/telescope#telescopenvim
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
}

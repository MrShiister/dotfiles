return {
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
}

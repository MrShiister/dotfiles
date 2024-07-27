return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      -- Don't use nvim-lspconfig for rust as rustaceanvim is preferred
      rust_analyzer = function()
        return true
      end,
    },
  },
}

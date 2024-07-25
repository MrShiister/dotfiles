local bufnr = vim.api.nvim_get_current_buf()

-- Open the floating error help
vim.keymap.set(
  "n",
  "<leader><Space>",
  vim.diagnostic.open_float,
  { desc = "Diagnostic: Open Float", silent = true, buffer = bufnr }
)

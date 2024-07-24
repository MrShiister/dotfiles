local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader><Space>", function()
  vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { desc = "Rust: Code Action", silent = true, buffer = bufnr })

vim.keymap.set("n", "gh", function()
  vim.cmd.RustLsp("hover", "actions") -- supports rust-analyzer's grouping
end, { desc = "Rust: Hover Actions", silent = true, buffer = bufnr })

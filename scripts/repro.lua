-- Bug reproducing script.
-- Run `nvim -u ~/repro.lua <FILE>`
vim.env.LAZY_STDPATH = ".repro"
load(vim.fn.system("curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"))()

require("lazy.minit").repro({
	spec = {
		{ "LazyVim/LazyVim" },
	},
})

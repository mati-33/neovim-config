local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("plugins.plugin_list")

require("plugins.config.autocompletion")
require("plugins.config.colorthemes")
require("plugins.config.gitsigns")
require("plugins.config.lsp")
require("plugins.config.lualine")
require("plugins.config.neo-tree")
require("plugins.config.none-ls")
require("plugins.config.telescope")
require("plugins.config.treesitter")

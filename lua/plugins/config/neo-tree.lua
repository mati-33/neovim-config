require("neo-tree").setup({
	close_if_last_window = true,
	enable_diagnostics = false,
	enable_git_status = false,
	filesystem = {
		filtered_items = { visible = true },
		window = {
			mappings = {
				["\\"] = "close_window",
			},
		},
	},
})

vim.keymap.set("n", "\\", ":Neotree reveal<CR>", {})
vim.keymap.set("n", "|", ":Neotree buffers float<CR>", {})

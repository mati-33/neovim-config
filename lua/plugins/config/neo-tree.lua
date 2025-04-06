require("neo-tree").setup({
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

return {
	"sindrets/diffview.nvim",
	config = function()
		vim.keymap.set("n", "<leader>di", "<cmd>DiffviewOpen<CR>", { desc = "[D]iffview againts the [I]ndex" })
		vim.keymap.set("n", "<leader>drh", "<cmd>DiffviewFileHistory<CR>", { desc = "[D]iffview [R]epo [H]istory" })
		vim.keymap.set("n", "<leader>dfh", "<cmd>DiffviewFileHistory %<CR>", { desc = "[D]iffview [F]ile [H]istory" })
		vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "[D]iffview [C]lose" })
	end,
}

return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = function()
		local neogit = require("neogit")

		neogit.setup({
			graph_style = "unicode",
		})

		vim.keymap.set("n", "<leader>ng", function()
			neogit.open({ cwd = "%:p:h" })
		end, {})
		vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", {})
	end,
}

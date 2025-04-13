local neogit = require("neogit")

neogit.setup({
	graph_style = "unicode",
})

vim.keymap.set("n", "<leader>ng", function()
	neogit.open({ cwd = "%:p:h" })
end, {})
vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", {})

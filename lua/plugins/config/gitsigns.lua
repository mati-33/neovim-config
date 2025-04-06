require("gitsigns").setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 10,
		ignore_whitespace = false,
		virt_text_priority = 100,
		use_focus = true,
	},
})

local gs = require("gitsigns")

vim.keymap.set("n", "<leader>gp", gs.preview_hunk_inline, {})
vim.keymap.set("n", "<leader>bl", gs.toggle_current_line_blame, {})
vim.keymap.set("n", "<leader>gb", gs.blame_line, {})
vim.keymap.set("n", "<leader>gd", gs.diffthis, {})
vim.keymap.set({ "n", "v" }, "<leader>gs", gs.stage_hunk, {})
vim.keymap.set({ "n", "v" }, "<leader>gS", gs.undo_stage_hunk, {})
vim.keymap.set({ "n", "v" }, "<leader>gr", gs.reset_hunk, {})
vim.keymap.set("n", "[h", gs.next_hunk, {})
vim.keymap.set("n", "]h", gs.prev_hunk, {})

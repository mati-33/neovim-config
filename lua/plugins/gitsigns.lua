-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
	"lewis6991/gitsigns.nvim",
	config = function()
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

		vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk_inline<CR>", {})
		vim.keymap.set("n", "<leader>bl", ":Gitsigns toggle_current_line_blame<CR>", {})
		vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", {})
		vim.keymap.set({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", {})
		vim.keymap.set({ "n", "v" }, "<leader>gS", ":Gitsigns undo_stage_hunk<CR>", {})
		vim.keymap.set("n", "[h", ":Gitsigns next_hunk<CR>", {})
		vim.keymap.set("n", "]h", ":Gitsigns prev_hunk<CR>", {})
	end,
}

return {
	"echasnovski/mini.files",
	version = false,
	lazy = false,
	config = function()
		local files = require("mini.files")
		files.setup({
			options = {
				use_as_default_explorer = true,
			},
			mappings = {
				synchronize = "s",
			},
		})

		local minifiles_toggle = function()
			if not files.close() then
				files.open()
			end
		end

		vim.keymap.set("n", "\\", function()
			minifiles_toggle()
		end, { desc = "toggle mini files" })
		vim.keymap.set("n", "|", function()
			files.open(vim.api.nvim_buf_get_name(0))
		end, { desc = "open directory of current file" })
	end,
}

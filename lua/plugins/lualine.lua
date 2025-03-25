return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			colored = true,
			update_in_insert = false,
			always_visible = false,
			cond = hide_in_width,
		}

		local macro = {
			function()
				local reg = vim.fn.reg_recording()
				return "recording @" .. reg
			end,
			cond = function()
				return vim.fn.reg_recording() ~= ""
			end,
		}

		local pyenv = {
			function()
				local env = os.getenv("VIRTUAL_ENV")
				if not env then
					return ""
				end
				return " " .. env:match("^.+/(.+)$")
			end,
			cond = function()
				return os.getenv("VIRTUAL_ENV") ~= ""
			end,
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = vim.g.colors_name,
				-- Some useful glyphs:
				-- https://www.nerdfonts.com/cheat-sheet
				--        
				section_separators = { left = "", right = "" },
				component_separators = { left = "|", right = "|" },
				disabled_filetypes = { "neo-tree" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {
					macro,
					pyenv,
					"branch",
					diagnostics,
					{ "filetype", cond = hide_in_width },
				},
				lualine_y = { "location" },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { { "location", padding = 0 } },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "fugitive" },
		})
	end,
}

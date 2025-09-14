return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			colored = true,
			update_in_insert = false,
			always_visible = false,
		}

		local macro = {
			function()
				local reg = vim.fn.reg_recording()
				return "recording @" .. reg
			end,
			cond = function()
				return vim.fn.reg_recording() ~= ""
			end,
			color = { fg = "#FF2C2C" },
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
				return os.getenv("VIRTUAL_ENV") ~= "" and vim.bo.filetype == "python"
			end,
			color = { fg = "#a6e3a1" },
		}

		local get_customized_vscode_theme = function()
			local custom_vscode = require("lualine.themes.vscode")
			local modes = {
				"normal",
				"visual",
				"inactive",
				"replace",
				"insert",
				"terminal",
				"command",
			}
			local fg_colors = { normal = "#ffffff" }
			for _, mode in ipairs(modes) do
				if mode ~= "normal" then
					fg_colors[mode] = custom_vscode[mode].b.fg
				end
			end

			local bg_color = "None"
			local b_fg_color = "#3e8fb0"

			-- c for visual mode is not defined
			custom_vscode.visual.c = { bg = bg_color }

			for _, mode in ipairs(modes) do
				custom_vscode[mode].a.fg = fg_colors[mode]
				custom_vscode[mode].a.bg = bg_color
				custom_vscode[mode].b.fg = b_fg_color
				custom_vscode[mode].b.bg = bg_color
				custom_vscode[mode].c.bg = bg_color
			end

			return custom_vscode
		end

		local file_parent = {
			function()
				local relative_filepath = vim.fn.expand("%:.")
				local parent = vim.fs.dirname(relative_filepath)
				if parent == "." then
					return ""
				end
				return parent
			end,
			color = { fg = "#9c9c9c" },
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = get_customized_vscode_theme(),
				-- Some useful glyphs:
				-- https://www.nerdfonts.com/cheat-sheet
				--        
				-- does not work well with transparent background
				-- section_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				-- component_separators = { left = " ", right = " " },
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "neo-tree" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					diagnostics,
					{ "filetype", icon_only = true },
					{ "filename", path = 0 },
					file_parent,
					"searchcount",
				},
				lualine_x = {
					macro,
					pyenv,
					"diff",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "fugitive", "quickfix" },
		})
	end,
}

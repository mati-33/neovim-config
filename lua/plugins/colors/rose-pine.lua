return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		local git_sings_colors = {
			add = "#6A9955",
			change = "#1167b1",
			delete = "#F44747",
		}

		local diff_colors = {
			add = "#2e4b2e",
			change = "#45565c",
			delete = "#4c1e15",
			text = "#996d74",
		}

		require("rose-pine").setup({
			variant = "moon", -- auto, main, moon, or dawn
			dark_variant = "main", -- main, moon, or dawn
			dim_inactive_windows = false,
			extend_background_behind_borders = true,

			enable = {
				terminal = true,
				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
				migrations = true, -- Handle deprecated options automatically
			},

			styles = {
				bold = false,
				italic = false,
				transparency = true,
			},

			groups = {
				border = "muted",
				link = "iris",
				panel = "surface",

				error = "love",
				hint = "iris",
				info = "foam",
				note = "pine",
				todo = "rose",
				warn = "gold",

				git_add = "foam",
				git_change = "rose",
				git_delete = "love",
				git_dirty = "rose",
				git_ignore = "muted",
				git_merge = "iris",
				git_rename = "pine",
				git_stage = "iris",
				git_text = "rose",
				git_untracked = "subtle",

				h1 = "iris",
				h2 = "foam",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "foam",
			},

			palette = {
				-- Override the builtin palette per variant
				-- moon = {
				--     base = '#18191a',
				--     overlay = '#363738',
				-- },
			},

			-- NOTE: Highlight groups are extended (merged) by default. Disable this
			-- per group via `inherit = false`
			highlight_groups = {
				-- Comment = { fg = "foam" },
				-- StatusLine = { fg = "love", bg = "love", blend = 15 },
				-- VertSplit = { fg = "muted", bg = "muted" },
				-- Visual = { fg = "base", bg = "text", inherit = false },

				TreesitterContextBottom = { underline = true, sp = "#333333" },

				DiffAdd = { fg = "NONE", bg = diff_colors.add, inherit = false },
				DiffDelete = { fg = "NONE", bg = diff_colors.delete, inherit = false },
				DiffChange = { fg = "NONE", bg = diff_colors.change, inherit = false },
				DiffText = { fg = "NONE", bg = diff_colors.text, inherit = false },

				GitSignsAdd = { fg = git_sings_colors.add, bg = "NONE" },
				GitSignsChange = { fg = git_sings_colors.change, bg = "NONE" },
				GitSignsDelete = { fg = git_sings_colors.delete, bg = "NONE" },
				GitSignsAddLn = { bg = git_sings_colors.add },
				GitSignsChangeLn = { bg = git_sings_colors.change },
				GitSignsDeleteLn = { bg = git_sings_colors.delete },
			},

			before_highlight = function(group, highlight, palette)
				-- Disable all undercurls
				-- if highlight.undercurl then
				--     highlight.undercurl = false
				-- end
				--
				-- Change palette colour
				-- if highlight.fg == palette.pine then
				--     highlight.fg = palette.foam
				-- end
			end,
		})

		vim.cmd("colorscheme rose-pine")
	end,
}

local c = require("vscode.colors").get_colors()
require("vscode").setup({
	-- Alternatively set style in setup
	-- style = 'light'

	-- Enable transparent background
	transparent = true,

	-- Enable italic comment
	italic_comments = true,

	-- Underline `@markup.link.*` variants
	underline_links = true,

	-- Disable nvim-tree background color
	disable_nvimtree_bg = true,

	-- Override colors (see ./lua/vscode/colors.lua)
	--color_overrides = {
	--	vscLineNumber = "#FFFFFF",
	--},

	-- Override highlight groups (see ./lua/vscode/theme.lua)
	group_overrides = {
		-- this supports the same val table as vim.api.nvim_set_hl
		-- use colors from this colorscheme by requiring vscode.colors!
		Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
		NeoTreeIndentMarker = { fg = "#444444", bg = "NONE", bold = true },
		GitSignsChange = { fg = "#1167b1", bg = "NONE" },
		TreesitterContext = { bg = "NONE" },
		TreesitterContextBottom = { underline = true, sp = "#272727" },
	},
})

require("rose-pine").setup({
	variant = "auto", -- auto, main, moon, or dawn
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

-- vim.cmd("colorscheme vscode")
vim.cmd("colorscheme rose-pine")

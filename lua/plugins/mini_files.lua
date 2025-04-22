return {
	"echasnovski/mini.files",
	version = false,
	config = true,
	keys = {
		{
			"\\",
			function()
				require("mini.files").open()
			end,
			desc = "mini files",
		},
	},
}

return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		{ "mati-33/multigit.nvim" },
	},
	config = function()
		vim.api.nvim_set_hl(0, "FindFilesFileTail", { fg = "#9c9c9c" })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "TelescopeResults",
			callback = function(ctx)
				vim.api.nvim_buf_call(ctx.buf, function()
					vim.fn.matchadd("TelescopeParent", "\t\t.*$")
					vim.api.nvim_set_hl(0, "TelescopeParent", { link = "FindFilesFileTail" })
				end)
			end,
		})

		local function filenameFirst(_, path)
			local tail = vim.fs.basename(path)
			local parent = vim.fs.dirname(path)
			if parent == "." then
				return tail
			end
			return string.format("%s\t\t%s", tail, parent)
		end

		require("telescope").setup({
			defaults = {
				path_display = { "truncate" },
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
						["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
						["<C-l>"] = require("telescope.actions").select_default, -- open file
						["<C-p>"] = require("telescope.actions.layout").toggle_preview,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
			pickers = {
				find_files = {
					path_display = filenameFirst,
				},
				buffers = {
					mappings = {
						i = {
							["<C-r>"] = require("telescope.actions").delete_buffer,
						},
					},
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "multigit")

		local builtin = require("telescope.builtin")
		local themes = require("telescope.themes")

		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", require("telescope.multi-ripgrep"), { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		-- Git
		vim.keymap.set("n", "<leader>sgs", function()
			builtin.git_status({ cwd = vim.fn.FugitiveWorkTree() })
		end, { desc = "[S]earch [G]it [S]tatus" })
		vim.keymap.set("n", "<leader>sgb", function()
			builtin.git_branches({ cwd = vim.fn.FugitiveWorkTree() })
		end, { desc = "[S]earch [G]it [B]ranches" })
		vim.keymap.set("n", "<leader>sgh", function()
			builtin.git_bcommits({ cwd = vim.fn.FugitiveWorkTree() })
		end, { desc = "[S]earch [G]it current file [H]istory" })

		-- MultiGit
		vim.keymap.set("n", "<leader>mgf", function()
			require("telescope").extensions.multigit.changed_files()
		end, { desc = "[M]ulti[G]it changed [F]iles", noremap = true })
		vim.keymap.set("n", "<leader>mgr", function()
			require("telescope").extensions.multigit.repos()
		end, { desc = "[M]ulti[G]it [R]epos", noremap = true })

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(themes.get_dropdown({
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		vim.keymap.set("n", "g9", function()
			local opts = {
				symbols = { "class", "method", "function" },
				results_title = "Classes, methods and functions",
				prompt_title = "Search",
				preview_title = "",
			}
			builtin.lsp_document_symbols(opts)
		end, { desc = "classes, methods and functions" })

		vim.keymap.set("n", "<leader>fa", function()
			builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
		end)
	end,
}

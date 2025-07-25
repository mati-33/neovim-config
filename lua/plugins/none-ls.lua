return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- Formatters & linters for mason to install
		require("mason-null-ls").setup({
			ensure_installed = {
				"prettier", -- ts/js formatter
				"stylua", -- lua formatter
				"eslint_d", -- ts/js linter
				"shfmt", -- Shell formatter
				"checkmake", -- linter for Makefiles
				-- "black", -- Python formatter
				-- "isort", -- Python imports sorter
				"gofmt", -- Go formatter
				"ruff", -- Python
			},
			automatic_installation = true,
		})

		local sources = {
			diagnostics.checkmake,
			formatting.prettier.with({ filetypes = { "html", "json", "yaml", "markdown", "javascript", "typescript" } }),
			formatting.stylua.with({ filetypes = { "lua" } }),
			formatting.shfmt.with({ args = { "-i", "4" } }),
			-- formatting.terraform_fmt,
			-- formatting.black.with({ filetypes = { "python" } }),
			-- formatting.isort.with({ filetypes = { "python" } }),
			require("none-ls.formatting.ruff").with({ filetypes = { "python" } }),
			require("none-ls.formatting.ruff_format").with({ filetypes = { "python" } }),

			formatting.gofmt.with({ filetypes = { "go" } }),
		}

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			-- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
			sources = sources,
			-- you can reuse a shared lspconfig on_attach callback here
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}

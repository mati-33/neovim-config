vim.api.nvim_create_user_command("Cd", function(opts)
	vim.cmd("cd " .. opts.fargs[1])
	print("Changed directory to: " .. vim.fn.getcwd())
end, { nargs = 1, complete = "dir" })

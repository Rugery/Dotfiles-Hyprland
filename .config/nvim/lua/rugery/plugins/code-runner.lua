return {
	"CRAG666/code_runner.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("code_runner").setup({
			filetype = {
				java = {
					"cd $dir &&",
					"javac $fileName &&",
					"java $fileNameWithoutExt",
				},
				python = "python3 -u",
				typescript = "deno run",
				rust = {
					"cd $dir &&",
					"rustc $fileName &&",
					"$dir/$fileNameWithoutExt",
				},
				c = function(...)
					local c_base = {
						"cd $dir &&",
						"gcc $fileName -o",
						"/tmp/$fileNameWithoutExt",
					}
					local c_exec = {
						"&& /tmp/$fileNameWithoutExt &&",
						"rm /tmp/$fileNameWithoutExt",
					}
					vim.ui.input({ prompt = "Add more args:" }, function(input)
						if input and input ~= "" then
							table.insert(c_base, input)
						end
						local full_cmd = vim.list_extend(c_base, c_exec)
						require("code_runner.commands").run_from_fn(full_cmd)
					end)
				end,
			},
		})
	end,
}

return {
	"RedsXDD/neopywal.nvim",
	name = "neopywal",
	lazy = false,
	priority = 1000,
	config = function()
		local neopywal = require("neopywal")
		neopywal.setup({
			transparent_background = true,
		})
		vim.defer_fn(function()
			vim.cmd("colorscheme neopywal-dark")
		end, 1) -- espera 100ms para asegurar que todo esté cargado
	end,
}

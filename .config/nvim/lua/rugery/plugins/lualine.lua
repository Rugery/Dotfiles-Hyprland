
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

        local mode = {
            'mode',
            fmt = function(str)
                return ' ' .. str
            end,
        }

        local diff = {
            'diff',
            colored = true,
            symbols = { added = ' ', modified = ' ', removed = ' ' },
        }

        local filename = {
            'filename',
            file_status = true,
            path = 0,
        }

        local branch = {'branch', icon = {''}}

		lualine.setup({
            icons_enabled = true,
			options = {
				-- Usa el tema por defecto (basado en el colorscheme activo)
				-- o puedes especificar 'auto' explícitamente
				theme = 'neopywal',
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "|", right = "" },
			},
			sections = {
                lualine_a = { mode },
                lualine_b = { branch },
                lualine_c = { diff, filename },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						-- puedes quitar este color también para usar el del esquema activo
						-- color = { fg = "#ff9e64" },
					},
					{ "filetype" },
				},
			},
		})
	end,
}

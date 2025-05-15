return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  config = function()
	require("oil").setup({
  		view_options = {
			show_hidden = true,
		},
		skip_confirm_for_simple_edits = true,
		delete_to_trash = true,
	})

  end
}

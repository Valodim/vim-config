return {
	'stevearc/oil.nvim',
	opts = {
		-- don't override C-s, we use it for saving
		keymaps = { ["<C-s>"] = false },
	},
	keys = {
		{ '-', ':lua require("oil").open()<CR>', mode = { 'n' }, desc = "Open parent directory" },
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

return {
	{
		'Wansmer/treesj',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		keys = {
			{ 'zj', function() require('treesj').join() end },
			{ 'zk', function() require('treesj').split() end },
		},
		opts = {
			use_default_keymaps = false,
		},
	},
}

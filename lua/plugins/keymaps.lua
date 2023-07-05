return {
  { 'tpope/vim-unimpaired', event = 'VeryLazy' },

	{
		'chaoren/vim-wordmotion',
		keys = {
			{ '<M-w>', '<Plug>WordMotion_w', mode = { 'n', 'x', 'o' } },
			{ '<M-e>', '<Plug>WordMotion_e', mode = { 'n', 'x', 'o' } },
			{ '<M-b>', '<Plug>WordMotion_b', mode = { 'n', 'x', 'o' } },
		},
		init = function()
			vim.g.wordmotion_nomap = 1
		end,
	},
}

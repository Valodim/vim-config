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

	{
		'kevinhwang91/nvim-hlslens',
		keys = {
			{ 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]] },
			{ 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]] },
			{ '<Leader><Space>', '<Cmd>nohlsearch<CR>' },
		},
		config = function ()
			-- for some reason it's required to call this explicitly, using the init function wouldn't work
			require('hlslens').setup()
			vim.cmd[[
				" toned down colors
				highlight! link HlSearchLens Comment
				highlight! link HlSearchLensNear Comment
			]]
		end,
	},

	{
		'haya14busa/vim-asterisk',
		dependencies = { 'kevinhwang91/nvim-hlslens' },
		keys = {
			{ '*', [[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]], mode = { 'n', 'x' } },
			{ 'g*', [[<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>]], mode = { 'n', 'x' } },
			{ '#', [[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]], mode = { 'n', 'x' } },
			{ 'g#', [[<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>]], mode = { 'n', 'x' } },
		},
		init = function()
			vim.g['asterisk#keeppos'] = 1
		end,
	},

	{
		'kana/vim-altr',
		config = function()
			-- load the colorscheme here
			vim.cmd([[
				call altr#define('%.ts', '%.test.ts')
				call altr#define('%.tsx', '%.stories.tsx', '%.module.css')
				call altr#define('protos/%.proto', 'domain/%.go', 'domain/%_test.go')
				call altr#define('%.up.sql', '%.down.sql')
				call altr#define('%.po', 'en/messages.po', 'de/messages.po')
			]])
		end,
		keys = {
			{ '<Leader>n', '<Plug>(altr-forward)', mode = { 'n' } },
			{ '<Leader>N', '<Plug>(altr-back)', mode = { 'n' } },
		},
	},

	{
		'rhysd/accelerated-jk',
		keys = {
			{ 'j', '<Plug>(accelerated_jk_j)', mode = { 'n' } },
			{ 'k', '<Plug>(accelerated_jk_k)', mode = { 'n' } },
		},
	},
}

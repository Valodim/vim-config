return {
	-----------------------------------------------------------------------------
	{
		'folke/trouble.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		-- stylua: ignore
		keys = {
			-- just adds some extra keys to rafi's config, see ../rafi/plugins/editor.lua
			{ 'gr', '<cmd>TroubleToggle lsp_references<CR>', desc = 'Trouble list references' },
			{ 'gR', '<cmd>TroubleToggle lsp_definitions<CR>', desc = 'Trouble list definitions' },
		},
	},
}

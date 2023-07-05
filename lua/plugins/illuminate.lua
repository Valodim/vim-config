return {
	{ -- override rafi's config to only use lsp providers
		'RRethy/vim-illuminate',
		opts = { under_cursor = true, providers = { 'lsp' } },
	},
}

-- stylelint_lsp settings
--

local lspconfig = require('lspconfig')

local config = {
	filetypes = { 'css' },
	root_dir = lspconfig.util.root_pattern('.stylelintrc', '.stylelintrc.json'),

	settings = {
		stylelintplus = {
			autoFixOnFormat = true,
		}
	},
}

return {
	config = function(_) return config end,
}

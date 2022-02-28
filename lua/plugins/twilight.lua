vim.api.nvim_exec([[
	highlight Twilight ctermfg=8
]], false)

require('twilight').setup {
	expand = {
		"function",
		"method",
		"table",
		"if_statement",
		"method_declaration",
		"method_definition",
		"function_declaration",
		"function_item",
	}
}

return {
	'KostkaBrukowa/definition-or-references.nvim',
	keys = {
		{ 'gd', function() require("definition-or-references").definition_or_references() end, mode = { 'n' } },
	},
	opts = {
		notify_options = false,
		on_references_result = function ()
			vim.cmd[[TroubleToggle lsp_references]]
		end 
	},
}

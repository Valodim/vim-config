return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'jose-elias-alvarez/typescript.nvim' },
			{ 'jose-elias-alvarez/null-ls.nvim' },
		},
		---@class PluginLspOpts
		opts = {
			-- LSP Server Settings
			---@type lspconfig.options
			servers = {
				yamlls = {
					filetypes = { 'yaml', 'yaml.ansible', 'yaml.docker-compose' },
				},
				jsonls = {
					on_new_config = function(new_config)
						-- Lazy-load schemastore when needed
						new_config.settings.json.schemas = new_config.settings.json.schemas
							or {}
						vim.list_extend(
							new_config.settings.json.schemas,
							require('schemastore').json.schemas()
						)
					end,
					settings = {
						json = {
							format = { enable = true },
							validate = { enable = true },
						},
					},
				},
				gopls = {},
				tsserver = {},
				rust_analyzer = {},
			},
			-- you can do any additional lsp server setup here
			-- return true if you don't want this server to be setup with lspconfig
			---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
			setup = {
				-- example to setup with typescript.nvim
				tsserver = function(_, opts)
					require('typescript').setup({ server = opts })
					return true
				end,
				-- Specify * to use this function as a fallback for any server
				-- ['*'] = function(server, opts) end,
			},
		},
	},
	{
		'jose-elias-alvarez/null-ls.nvim',
		opts = function()
			local function has_exec(filename)
				return function(_)
					return vim.fn.executable(filename) == 1
				end
			end
			local builtins = require('null-ls').builtins
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
			return {
				fallback_severity = vim.diagnostic.severity.INFO,
				should_attach = function(bufnr)
					return not vim.api.nvim_buf_get_name(bufnr):match('^[a-z]+://')
				end,
				root_dir = require('null-ls.utils').root_pattern(
					'.git',
					'_darcs',
					'.hg',
					'.bzr',
					'.svn',
					'.null-ls-root',
					'.neoconf.json',
					'Makefile'
				),
				sources = {
					builtins.formatting.stylua,
					builtins.formatting.shfmt,

					-- protobuf
					builtins.diagnostics.protoc_gen_lint.with({
						runtime_condition = has_exec('protoc'),
						extra_args = function(params)
							-- add path of the proto file to include dirs
							local include_path = string.gsub(params.bufname, '[^/]+$', '')
							return {'-I', include_path}
						end
					}),

					builtins.diagnostics.eslint_d, -- eslint or eslint_d
					builtins.code_actions.eslint_d, -- eslint or eslint_d
					builtins.formatting.prettierd.with({
						runtime_condition = has_exec('prettierd'),
						disabled_filetypes = { 'css', 'scss' },
					}),
				},
			}
		end,
	},
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"j-hui/fidget.nvim",
	},
	config = function()
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)
		local mason_tool_installer = require("mason-tool-installer")
		require("fidget").setup({})
		require("mason").setup()

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"pylint",
				"eslint_d",
				"php-cs-fixer",
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"eslint",
				"lua_ls",
				"bashls",
				"clangd",
				"html",
				"jdtls",
				"ts_ls",
				"cssls",
				"intelephense",
			},
			handlers = {
				function(server_name)
					if server_name == "rust_analyzer" then
						return
					end
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
								},
								diagnostics = {
									globals = { "vim", "love" },
								},
								workspace = {
									library = {
										vim.env.VIMRUNTIME,
									},
								},
							},
						},
					})
				end,

				cssls = function()
					require("lspconfig").cssls.setup({
						capabilities = capabilities,
						settings = {
							css = {
								lint = {
									unknownAtRules = "ignore",
								},
							},
						},
					})
				end,

				intelephense = function()
					require("lspconfig").intelephense.setup({
						capabilities = capabilities,
						settings = {
							intelephense = {
								licenceKey = "",
								stubs = {
									"bcmath",
									"bz2",
									"calendar",
									"ctype",
									"curl",
									"date",
									"dom",
									"enchant",
									"exif",
									"ffi",
									"fileinfo",
									"filter",
									"ftp",
									"gd",
									"gettext",
									"gmp",
									"hash",
									"iconv",
									"imap",
									"intl",
									"json",
									"ldap",
									"libxml",
									"mbstring",
									"mcrypt",
									"mssql",
									"mysqli",
									"oci8",
									"odbc",
									"openssl",
									"pcntl",
									"pcre",
									"pdo",
									"pgsql",
									"phar",
									"posix",
									"pspell",
									"readline",
									"recode",
									"reflection",
									"session",
									"shmop",
									"SimpleXML",
									"snmp",
									"soap",
									"sockets",
									"sodium",
									"spl",
									"sqlite3",
									"standard",
									"tokenizer",
									"xml",
									"xmlreader",
									"xmlrpc",
									"xmlwriter",
									"xsl",
									"zip",
									"zlib",
								},
							},
						},
					})
				end,
			},
		})
	end,
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
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
				"php-cs-fixer", -- For PHP formatting
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"eslint",
				"lua_ls",
				"rust_analyzer",
				"bashls",
				"clangd",
				"html",
				"jdtls",
				"ts_ls",
				"tailwindcss-language-server",
				"cssls",
				"intelephense", -- PHP Language Server
			},
			handlers = {
				function(server_name)
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

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			sources = {
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "buffer", keyword_length = 3 },
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
		})
	end,
}

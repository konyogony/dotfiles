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

		require("fidget").setup({})
		require("mason").setup()

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"pylint",
				"eslint_d",
				"php-cs-fixer",
				"tree-sitter-cli",
			},
		})

		local servers = {
			"eslint",
			"lua_ls",
			"bashls",
			"clangd",
			"html",
			"jdtls",
			"ts_ls",
			"cssls",
			"intelephense",
		}

		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_installation = false,
		})

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim", "love" } },
					workspace = { library = { vim.env.VIMRUNTIME } },
				},
			},
		})

		vim.lsp.config("cssls", {
			capabilities = capabilities,
			settings = {
				css = { lint = { unknownAtRules = "ignore" } },
			},
		})

		vim.lsp.config("intelephense", {
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

		for _, server_name in ipairs(servers) do
			if server_name ~= "lua_ls" and server_name ~= "cssls" and server_name ~= "intelephense" then
				vim.lsp.config(server_name, { capabilities = capabilities })
			end
		end

		vim.lsp.enable(servers)
	end,
}

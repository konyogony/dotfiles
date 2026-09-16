return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	lazy = false,
	init = function()
		vim.g.rustaceanvim = {
			server = {
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							buildScripts = {
								enable = true,
							},
						},
						procMacro = {
							enable = true,
						},
						completion = {
							autoimport = {
								enable = true,
							},
							privateEditable = {
								enable = true,
							},
						},
						inlayHints = {
							chainingHints = { enable = true },
							parameterHints = { enable = true },
							typeHints = { enable = true },
							closureReturnTypeHints = { enable = "always" },
						},
					},
				},
			},
		}
	end,
}

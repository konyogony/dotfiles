return {
	"mrcjkb/rustaceanvim",
	lazy = false,
	config = function()
		vim.g.rustaceanvim = {
			server = {
				on_attach = function(client, bufnr)
					client.server_capabilities.semanticTokensProvider = nil
				end,
			},
		}
	end,
}

return {
	"0PandaDEV/ziit-neovim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("ziit").setup({
			api_key = vim.env.ZIIT_API_KEY,
			base_url = "https://wakatime.proxied.host",
		})
	end,
}

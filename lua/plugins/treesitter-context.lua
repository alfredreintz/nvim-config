return {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("treesitter-context").setup({
			enable = true,         -- aktivera pluginet
			max_lines = 1,         -- visar bara den aktuella funktionen
			trim_scope = "outer",  -- trimma yttre scope om det blir långt
			mode = "cursor",       -- uppdatera när markören flyttas
			separator = nil,       -- kan sättas till "─" om du vill ha linje under
			zindex = 20,           -- renderingsordning
		})
	end,
}


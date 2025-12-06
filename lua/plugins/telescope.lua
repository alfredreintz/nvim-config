-- return {
--   {
--     'nvim-telescope/telescope.nvim', tag = '0.1.6',
--     dependencies = { 'nvim-lua/plenary.nvim' },
--     config = function()
--       local builtin = require('telescope.builtin')
--       vim.keymap.set('n', '<C-p>', builtin.find_files, {})
--       vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--     end
--   },
--   {
--     'nvim-telescope/telescope-ui-select.nvim',
--     config = function()
--       require("telescope").setup({
--         extensions = {
--           ["ui-select"] = {
--             require("telescope.themes").get_dropdown {
--             }
--           }
--         }
--       })
--       require("telescope").load_extension("ui-select")
--     end
--   },
-- }

-- return {
--   {
--     'nvim-telescope/telescope.nvim',
--     tag = '0.1.6',
--     dependencies = { 'nvim-lua/plenary.nvim' },
--     config = function()
--       local telescope = require('telescope')
--       local builtin = require('telescope.builtin')
--       local actions = require('telescope.actions')
--       local layout = require('telescope.actions.layout')
--
--       telescope.setup({
--         defaults = {
--           layout_strategy = "flex",  -- Anpassar automatiskt mellan horisontellt/vertikalt
--           layout_config = {
--             width = 0.9,
--             height = 0.9,
--             horizontal = {
--               preview_width = 0.55,  -- ger preview gott om plats
--             },
--             vertical = {
--               preview_height = 0.5,
--             },
--           },
--           sorting_strategy = "ascending",
--           winblend = 5,
--           wrap_results = true,
--
--           mappings = {
--             i = {
--               ["<C-p>"] = layout.toggle_preview, -- toggle preview med Ctrl+p i insert-läge
--               ["<C-u>"] = false,  -- tar bort scroll conflict
--               ["<C-d>"] = false,
--             },
--             n = {
--               ["p"] = layout.toggle_preview, -- toggle preview i normal-läge
--             },
--           },
--         },
--       })
--
--       -- keymaps
--       vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "Find files" })
--       vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
--     end,
--   },
--
--   {
--     'nvim-telescope/telescope-ui-select.nvim',
--     config = function()
--       require("telescope").setup({
--         extensions = {
--           ["ui-select"] = {
--             require("telescope.themes").get_dropdown {}
--           }
--         }
--       })
--       require("telescope").load_extension("ui-select")
--     end,
--   }
-- }
return {  {
  "nvim-telescope/telescope-ui-select.nvim",  },  {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
	  require("telescope").setup({
		  extensions = {
			  ["ui-select"] = {
				  require("telescope.themes").get_dropdown({}),
			  },
		  },
	  })
	  local builtin = require("telescope.builtin")
	  vim.keymap.set("n", "<C-p>", builtin.find_files, {})
	  vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
	  vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

	  vim.keymap.set("n", "<leader>ff", function()
		  require("telescope.builtin").find_files({ hidden = true })
	  end)

	  require("telescope").load_extension("ui-select")
  end,  },
}

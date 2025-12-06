return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- close Neo-tree if it's the last window open
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_current",
        window = {
          position = "current", -- 👈 full-window mode (replaces current buffer)
          mappings = {
            ["<esc>"] = "close_window",
            ["<CR>"] = "open",
          },
        },
      },
      default_component_configs = {
        diagnostics = {
          enable = true,
          symbols = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
      },
    })

    -- 🔑 Keymap: toggle full-window Neo-tree
    vim.keymap.set("n", "<C-n>", ":Neotree toggle filesystem reveal_force_cwd<CR>", { desc = "Toggle Neo-tree (full window)" })
  end,
}

return {
  "3rd/image.nvim",
  build = false,
  opts = {
    backend = "kitty", -- or "ueberzug", "viu"
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = true,
        download_remote_images = true,
        only_render_image_at_cursor = false,
      },
      neorg = {
        enabled = true,
        clear_in_insert_mode = false,
      },
    },
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = nil,
    max_height_window_percentage = 50,
    window_overlap_clear_enabled = true,
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  },
}


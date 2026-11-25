require("image").setup({
  backend = "kitty", -- Kitty graphics protocol works in compatible terminals like Kitty or Ghostty
  kitty_method = "normal",
  integrations = {},
  max_width = 100,
  max_height = 12,
  max_height_window_percentage = math.huge,
  max_width_window_percentage = math.huge,
  window_overlap_clear_enabled = true,
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
})

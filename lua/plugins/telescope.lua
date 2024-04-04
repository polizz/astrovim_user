return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    return require("astrocore").extend_tbl(opts, {
      defaults = {
        layout_config = {
          preview_cutoff = 120,
          width = 0.95,
          height = 0.90,
          vertical = {
            preview_height = 0.95,
          },
          horizontal = {
            preview_width = 0.6,
          }
        }
      }
    })
  end
}

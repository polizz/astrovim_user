
return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- {
  --   "rebelot/heirline.nvim",
  --   config = function(plugin, opts)
  --     require("plugins.configs.telescope")(plugin, opts)
  --     local harpoon = require("harpoon")
  --
  --     function Harpoon_files()
  --         local contents = {}
  --         local marks_length = harpoon:list():length()
  --         local current_file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
  --         for index = 1, marks_length do
  --           local harpoon_file_path = harpoon:list():get(index).value
  --           local file_name = harpoon_file_path == "" and "(empty)" or vim.fn.fnamemodify(harpoon_file_path, ':t')
  --
  --           if current_file_path == harpoon_file_path then
  --             contents[index] = string.format("%%#HarpoonNumberActive# %s. %%#HarpoonActive#%s ", index, file_name)
  --           else
  --             contents[index] = string.format("%%#HarpoonNumberInactive# %s. %%#HarpoonInactive#%s ", index, file_name)
  --           end
  --         end
  --
  --         return table.concat(contents)
  --       end
  --
  --       vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "User" }, {
  --         callback = function()
  --             vim.o.tabline = Harpoon_files()
  --         end
  --     })
  --   end
  -- },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    "kylechui/nvim-surround",
    -- tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      return require("astronvim.utils").extend_tbl(opts, {
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
}

-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local harpoon = require("harpoon")
harpoon:setup()

return {
  -- first key is the mode
  i = {
    ["kj"] = { "<ESC>", desc = "Escape" },  -- change description but the same command
  },
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    ["<leader>a"] = { function() harpoon:list():append() end, desc = "Harpoon append" },
    ["<leader>r"] = { function() harpoon:list():remove() end, desc = "Harpoon remove"  },
    ["<C-f>"] = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end },
    ["<C-j>"] = { function() harpoon:list():select(1) end },
    ["<C-k>"] = { function() harpoon:list():select(2) end },
    ["<C-l>"] = { function() harpoon:list():select(3) end },
    ["<C-i>"] = { function() harpoon:list():select(4) end },
    ["<C-[>"] = { function() harpoon:list():prev() end },
    ["<C-]>"] = { function() harpoon:list():next() end },

    ["<leader>qq"] = { function() _G.qrz.lookup() end },

    ["<leader>fg"] = { ":Telescope live_grep<cr>", desc = "Live Grep"  },
    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<leader>w"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}

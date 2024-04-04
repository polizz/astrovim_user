return {
  "AstroNvim/astrocore",
  opts = function(_, opts)
    local harpoon = require("harpoon")
    harpoon:setup()

    _G.qrz = require("qrz")

    local astro = require("astrocore")
    local mappings = {}

    mappings = {
      mappings = {
        i = {
          ["kj"] = { "<ESC>", desc = "Escape" },
        },
        n = {
          ["<Leader>a"] = { function() harpoon:list():append() end, desc = "Harpoon append" },
          ["<Leader>r"] = { function() harpoon:list():remove() end, desc = "Harpoon remove"  },
          ["<C-f>"] = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end },
          ["<C-j>"] = { function() harpoon:list():select(1) end, desc = "Harpoon File 1" },
          ["<C-k>"] = { function() harpoon:list():select(2) end, desc = "Harpoon File 2" },
          ["<C-l>"] = { function() harpoon:list():select(3) end, desc = "Harpoon File 3"  },
          ["<C-i>"] = { function() harpoon:list():select(4) end, desc = "Harpoon File 4"  },
          ["<C-[>"] = { function() harpoon:list():prev() end },
          ["<C-]>"] = { function() harpoon:list():next() end },
          ["<Leader>qq"] = { function() _G.qrz.lookup() end, desc = "QRZ callsign lookup" },
          ["<Leader>fg"] = { ":Telescope live_grep<cr>", desc = "Live Grep"  },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          ["<Leader>b"] = { name = "Buffers" },
          ["<Leader>w"] = { ":w!<cr>", desc = "Save File" }, 
        }
      }
    }

    return astro.extend_tbl(opts, mappings)
  end
}

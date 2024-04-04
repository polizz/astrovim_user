return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "AstroNvim/astrolsp", opts = {} },
  },
  config = function()
    -- set up servers configured with AstroLSP
    vim.tbl_map(require("astrolsp").lsp_setup, require("astrolsp").config.servers)
  end,
}

return {
  "williamboman/mason.nvim",
  config = function()
    return require("mason").setup({ PATH = "append" }) -- use system rust-analyzer
  end
}

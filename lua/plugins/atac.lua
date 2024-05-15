return {
  "NachoNievaG/atac.nvim",
  enabled = false,
  dependencies = { "akinsho/toggleterm.nvim" },
  config = function()
    require("atac").setup {
      dir = "~/.config/atac", -- By default, the dir will be set as /tmp/atac
    }
  end,
}

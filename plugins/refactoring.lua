return {
  "ThePrimeagen/refactoring.nvim",
  cmd = "Refactor",
  opts = {
    ensure_installed = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  config = function() require("refactoring").setup {} end,
}

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
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  { "mattn/emmet-vim" },
  { "ekalinin/Dockerfile.vim" },
  {
    "kylechui/nvim-surround",
    config = function() require("nvim-surround").setup() end,
  },
  {
    "mhanberg/elixir.nvim",
    lazy = false,
    config = function() require("elixir").setup() end,
  },
  { "sainnhe/gruvbox-material", lazy = false },
  { "wuelnerdotexe/vim-astro" },
  { "rebelot/kanagawa.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "folke/tokyonight.nvim" },
  { "drewtempelmeyer/palenight.vim" },
  { "Everblush/everblush.nvim", as = "everblush" },
  { "Mofiqul/dracula.nvim", as = "dracula" },
  { "olimorris/onedarkpro.nvim" },
  {
    "rose-pine/neovim",
    as = "rose-pine",
    config = function() require("rose-pine").setup() end,
  },
  { "prisma/vim-prisma" },
  {
    "ray-x/go.nvim",
    config = function() require("go").setup() end,
  },
}

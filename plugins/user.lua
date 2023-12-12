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
  -- { "dmmulroy/tsc.nvim" },
  -- { "ellisonleao/carbon-now.nvim", cmd = "CarbonNow", lazy = false },
  -- {
  --   "andweeb/presence.nvim",
  --   lazy = false,
  --   config = function()
  --     require("presence").setup {
  --       auto_update = true,
  --       neovim_image_text = "A wise choice",
  --       main_image = "neovim",
  --       client_id = "1071630966734458952",
  --       debounce_timeout = 10,
  --       show_time = true,
  --       log_level = "debug",
  --       editing_text = "Typing things into %s",
  --       file_explorer_text = "Browsing %s",
  --       git_commit_text = "Committing changes",
  --       plugin_manager_text = "Managing plugins",
  --       reading_text = "Probably finding bugs in %s",
  --       workspace_text = "Working on %s",
  --       line_number_text = "Line %s out of %s",
  --     }
  --   end,
  -- },
  { "lunarvim/primer.nvim", lazy = false },
  { "aktersnurra/no-clown-fiesta.nvim", lazy = false },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("todo-comments").setup() end,
  },
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  { "wuelnerdotexe/vim-astro" },
  { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu", lazy = false },
  { "mattn/emmet-vim", lazy = false },
  { "ekalinin/Dockerfile.vim" },
  {
    "kylechui/nvim-surround",
    lazy = false,
    config = function() require("nvim-surround").setup() end,
  },
  {
    "mhanberg/elixir.nvim",
    config = function() require("elixir").setup() end,
  },
  { "sainnhe/gruvbox-material", as = "gruvbox-material", lazy = false },
  { "ayu-theme/ayu-vim", as = "ayu-vim", lazy = false },
  { "wuelnerdotexe/vim-astro", lazy = false },
  { "rebelot/kanagawa.nvim", lazy = false },
  { "EdenEast/nightfox.nvim", lazy = false },
  { "folke/tokyonight.nvim", lazy = false },
  { "drewtempelmeyer/palenight.vim", lazy = false },
  { "Everblush/everblush.nvim", as = "everblush", lazy = false },
  { "Mofiqul/dracula.nvim", as = "dracula", lazy = false },
  { "olimorris/onedarkpro.nvim", lazy = false },
  {
    "rose-pine/neovim",
    as = "rose-pine",
    lazy = false,
    config = function() require("rose-pine").setup() end,
  },
  { "prisma/vim-prisma", lazy = false },
  {
    "ray-x/go.nvim",
    config = function() require("go").setup() end,
  },
  { "luisiacc/gruvbox-baby", lazy = false },
}

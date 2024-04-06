---@type LazySpec
return {
  "andweeb/presence.nvim",
  {
    "TobinPalmer/rayso.nvim",
    cmd = { "Rayso" },
    config = function()
      require("rayso").setup {
        open_cmd = "chromium",
        base_url = "https://ray.so",
        options = {
          title = "Code",
          background = false,
          theme = "crimson",
          dark_mode = true,
          padding = 64,
          logging_enabled = false,
          logging_path = "/tmp",
          logging_file = "rayso.log",
        },
      }
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  { "ethanholz/freeze.nvim", config = true, lazy = false },

  { "inko-lang/inko.vim" },
  { "projekt0n/github-nvim-theme", lazy = false },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "sourcegraph/sg.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("sg").setup {} end,
  },
  { "lunarvim/primer.nvim", lazy = false },
  { "dmmulroy/ts-error-translator.nvim", config = function() require("ts-error-translator").setup() end },
  { "aktersnurra/no-clown-fiesta.nvim", lazy = false },
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("todo-comments").setup() end,
  },
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
  { "ayu-theme/ayu-vim", as = "ayu-vim", lazy = false },
  { "wuelnerdotexe/vim-astro", lazy = false },
  { "rebelot/kanagawa.nvim", lazy = false },
  { "folke/tokyonight.nvim", lazy = false },
  { "drewtempelmeyer/palenight.vim", lazy = false },
  { "Everblush/everblush.nvim", as = "everblush", lazy = false },
  { "prisma/vim-prisma" },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function() require("go").setup() end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
  { "luisiacc/gruvbox-baby", lazy = false },

  -- customize alpha options
  { "max397574/better-escape.nvim" },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}

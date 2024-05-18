-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
--
-- Legacy gleam support
---@class ParserInfo
-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.gleam = {
--   install_info = {
--     url = "~/tree-sitter-gleam",
--     files = { "src/parser.c", "src/scanner.c" },
--     branch = "main",
--   },
--   filetype = "gleam",
-- }

local user_utils = require "utils"

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = true, -- sets vim.opt.wrap
        termguicolors = true,
        background = "dark",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        gruvbox_material_background = "hard",
        gruvbox_material_better_performance = 1,
        astro_typescript = "enable",
      },
    },
    -- Mappings can be configured through AstroCore as well.
    mappings = {
      -- first key is the mode
      n = {
        ["<C-Down>"] = false,
        ["<C-Left>"] = false,
        ["<C-Right>"] = false,
        ["<C-Up>"] = false,
        ["<C-q>"] = false,
        ["<C-s>"] = false,
        ["]b"] = false,
        ["[b"] = false,
        -- Increment and decrement
        ["-"] = { "<c-x>", desc = "Decrement number" },
        ["+"] = { "<c-a>", desc = "Increment number" },

        n = { user_utils.better_search "n", desc = "Next search" },
        N = { user_utils.better_search "N", desc = "Previous search" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },

        -- Buffer navigation
        ["<S-l>"] = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        ["<S-h>"] = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },

        --  neo-tree
        ["<leader>e"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
        ["<leader>o"] = {
          function()
            if vim.bo.filetype == "neo-tree" then
              vim.cmd.wincmd "p"
            else
              vim.cmd.Neotree "focus"
            end
          end,
          desc = "Toggle Explorer Focus",
        },

        -- Code actions
        ["<leader>a"] = { "<cmd>CodeActionMenu<CR>", desc = "Show code action menu" },
        -- refactoring
        ["<leader>r"] = { "<cmd>Refactor<cr>", desc = "Refactor" }, -- this is to set the prefix properly in which-key
        ["<leader>rr"] = {
          function() require("refactoring").select_refactor { show_success_message = true } end,
          desc = "Show refactoring options",
        },
        ["<leader>ri"] = { "<cmd>Refactor inline_var<cr>", desc = "Inline variable" },
        ["<leader>rb"] = { "<cmd>Refactor extract_block<cr>", desc = "Extract block" },
        ["<leader>rl"] = { "<cmd>Refactor extract_block_to_file<cr>", desc = "Extract block to file" },
        ["<leader>rp"] = {
          function() require("refactoring").debug.printf { below = false, show_success_message = true } end,
          desc = "Debugging - printf",
        },
        ["<leader>r`"] = {
          function() require("refactoring").debug.print_var { show_success_message = true } end,
          desc = "Debugging - print var",
        },
        ["<leader>rc"] = {
          function() require("refactoring").debug.cleanup { show_success_message = true } end,
          desc = "Debugging - cleanup",
        },
        ["]t"] = {
          function() require("todo-comments").jump_next() end,
          desc = "Next todo comment",
        },
        ["[t"] = {
          function() require("todo-comments").jump_prev() end,
          desc = "Previous todo comment",
        },

        -- Trouble.nvim
        ["<leader>xx"] = { function() require("trouble").toggle() end, desc = "Show trouble" },
        ["<leader>xc"] = { function() require("trouble").close() end, desc = "Close trouble" },
        ["<leader>xw"] = {
          function() require("trouble").toggle "workspace_diagnostics" end,
          desc = "Workspace diagnostics",
        },
        ["<leader>xd"] = {
          function() require("trouble").toggle "document_diagnostics" end,
          desc = "Document diagnostics",
        },
        ["<leader>xq"] = { function() require("trouble").toggle "quickfix" end, desc = "Quickfix" },
        ["<leader>xl"] = { function() require("trouble").toggle "loclist" end, desc = "Location list" },
        ["<leader>xk"] = {
          function() require("trouble").previous { skip_groups = false, jump = true } end,
          desc = "Previous item",
        },
        ["<leader>xj"] = {
          function() require("trouble").next { skip_groups = false, jump = true } end,
          desc = "Next item",
        },
        ["<leader>xg"] = {
          function() require("trouble").last { skip_groups = false, jump = true } end,
          desc = "Last item",
        },
        ["gR"] = { function() require("trouble").toggle "lsp_references" end },

        -- Sourcegraph (cody)
        ["<leader>ss"] = {
          function() require("sg.extensions.telescope").fuzzy_search_results() end,
          desc = "Search using Sourcegraph",
        },
        ["<leader>sh"] = {
          function() require("sg.keymaps").help() end,
          desc = "Show keymaps help",
        },
        ["<leader>sc"] = {
          function() require("sg.cody.commands").toggle() end,
          desc = "Toggle Cody chat panel",
        },
        ["<leader>sf"] = {
          function() require("sg.cody.commands").history() end,
          desc = "Show Cody chat history",
        },
        ["<leader>sp"] = {
          function() require("sg.cody.commands").focus_prompt() end,
          desc = "Focus prompt pane",
        },

        -- Laravel
        ["<leader>lv"] = { ":Laravel artisan<cr>", desc = "Run Laravel artisan commands" },

        -- Dadbod

        ["<leader>D"] = { name = "󰆼 Dadbod" },
        ["<leader>Da"] = { "<cmd>DBUIAddConnection<cr>", desc = "Add new connection" },
        ["<leader>Dd"] = { "<cmd>DBUIToggle<cr>", desc = "Toggle DB UI" },
        ["<leader>Df"] = { "<cmd>DBUIFindBuffer<cr>", desc = "Find buffer" },
        ["<leader>Dr"] = { "<cmd>DBUIRenameBuffer<cr>", desc = "Rename buffer" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
      i = {
        -- These have been replaced by just tab in the community plugin
        -- ["<M-tab>"] = { 'copilot#Accept("<CR>")', noremap = true, silent = true, expr = true, replace_keycodes = false },
        -- ["<C-\\>"] = { 'copilot#Accept("<CR>")', noremap = true, silent = true, expr = true, replace_keycodes = false },
      },
      x = {
        -- better increment/decrement
        ["+"] = { "g<C-a>", desc = "Increment number" },
        ["-"] = { "g<C-x>", desc = "Decrement number" },
        -- line text-objects
        ["il"] = { "g_o^", desc = "Inside line text object" },
        ["al"] = { "$o^", desc = "Around line text object" },
        -- Easy-Align
        ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
        -- vim-sandwich
        ["s"] = "<Nop>",
        -- refactoring
        ["<leader>r"] = { "<cmd>Refactor<cr>", desc = "Refactor" }, -- this is to set the prefix properly in which-key
        ["<leader>rr"] = {
          function() require("refactoring").select_refactor { show_success_message = true } end,
          desc = "Show refactoring options",
        },
        ["<leader>re"] = { "<cmd>Refactor extract <cr>", desc = "Extract function" },
        ["<leader>rf"] = { "<cmd>Refactor extract_to_file <cr>", desc = "Extract function to file" },
        ["<leader>rv"] = { "<cmd>Refactor extract_var <cr>", desc = "Extract variable" },
        ["<leader>ri"] = { "<cmd>Refactor inline_var<cr>", desc = "Inline variable" },
        ["<leader>r`"] = {
          function() require("refactoring").debug.print_var { show_success_message = true } end,
          desc = "Debugging - print var",
        },
      },
    },
  },
}

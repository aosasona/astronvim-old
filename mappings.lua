-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local utils = require "user.utils"
return {
  n = {
    -- disable default mapping
    ["<C-Down>"] = false,
    ["<C-Left>"] = false,
    ["<C-Right>"] = false,
    ["<C-Up>"] = false,
    ["<C-q>"] = false,
    ["<C-s>"] = false,
    ["]b"] = false,
    ["[b"] = false,
    -- Increment and decrement
    ["-"] = { "<c-x>", desc = "Descrement number" },
    ["+"] = { "<c-a>", desc = "Increment number" },
    -- Search
    n = { utils.better_search "n", desc = "Next search" },
    N = { utils.better_search "N", desc = "Previous search" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>b"] = { name = "Buffers" },
    -- Buffer navigation
    ["<S-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
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
    ["<leader>rr"] = { function() require("refactoring").select_refactor {} end, desc = "Show refactoring options" },
    ["<leader>ri"] = { "<cmd>Refactor inline_var<cr>", desc = "Inline variable" },
    ["<leader>rb"] = { "<cmd>Refactor extract_block<cr>", desc = "Extract block" },
    ["<leader>rl"] = { "<cmd>Refactor extract_block_to_file<cr>", desc = "Extract block to file" },
    ["<leader>rp"] = {
      function() require("refactoring").debug.printf { below = false } end,
      desc = "Debugging - printf",
    },
    ["<leader>r`"] = {
      function() require("refactoring").debug.print_var {} end,
      desc = "Debugging - print var",
    },
    ["<leader>rc"] = {
      function() require("refactoring").debug.cleanup {} end,
      desc = "Debugging - cleanup",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<M-tab>"] = { 'copilot#Accept("<CR>")', silent = true, expr = true },
    ["<C-/>"] = { 'copilot#Accept("<CR>")', silent = true, expr = true },
  },
  x = {
    -- better increment/decrement
    ["+"] = { "g<C-a>", desc = "Increment number" },
    ["-"] = { "g<C-x>", desc = "Descrement number" },
    -- line text-objects
    ["il"] = { "g_o^", desc = "Inside line text object" },
    ["al"] = { "$o^", desc = "Around line text object" },
    -- Easy-Align
    ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
    -- vim-sandwich
    ["s"] = "<Nop>",
    -- refactoring
    ["<leader>r"] = { "<cmd>Refactor<cr>", desc = "Refactor" }, -- this is to set the prefix properly in which-key
    ["<leader>rr"] = { function() require("refactoring").select_refactor {} end, desc = "Show refactoring options" },
    ["<leader>re"] = { "<cmd>Refactor extract <cr>", desc = "Extract function" },
    ["<leader>rf"] = { "<cmd>Refactor extract_to_file <cr>", desc = "Extract function to file" },
    ["<leader>rv"] = { "<cmd>Refactor extract_var <cr>", desc = "Extract variable" },
    ["<leader>ri"] = { "<cmd>Refactor inline_var<cr>", desc = "Inline variable" },
    ["<leader>r`"] = {
      function() require("refactoring").debug.print_var {} end,
      desc = "Debugging - print var",
    },
  },
  o = {
    -- line text-objects
    ["il"] = { ":normal vil<cr>", desc = "Inside line text object" },
    ["al"] = { ":normal val<cr>", desc = "Around line text object" },
  },
}

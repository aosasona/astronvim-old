return {
  { "williamboman/mason.nvim", opts = { PATH = "append" } },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "cssls",
        "gopls",
        "html",
        "intelephense",
        "marksman",
        "jsonls",
        "pyright",
        "lua_ls",
        "tsserver",
        "yamlls",
        "astro",
        "eslint",
        "bashls",
        "emmet_ls",
        "cssmodules_ls",
        "ruby_ls",
        "sqlls",
        "tailwindcss",
        "rust_analyzer",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "shellcheck",
        "stylua",
        "black",
        "prettierd",
        "shfmt",
        "shellcheck",
        "goimports",
        "goimports",
        "gomodifytags",
        "gotests",
      },
      handlers = {
        taplo = function() end, -- disable taplo in null-ls, it's taken care of by lspconfig
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "bash",
        "cppdbg",
        "delve",
        "js",
        "php",
        "python",
      },
    },
  },
}

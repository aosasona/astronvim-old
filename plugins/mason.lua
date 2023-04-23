return {
  { "williamboman/mason.nvim", opts = { PATH = "append" } },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
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
        "elixirls",
        "emmet_ls",
        "cssmodules_ls",
        "prismals",
        "ruby_ls",
        "sqlls",
        "tailwindcss",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "shellcheck",
        "codespell",
        "stylua",
        "black",
        "isort",
        "prettierd",
        "shfmt",
        "shellcheck",
        "sqlfmt",
        "goimports",
        "golines",
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

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
        "erlangls",
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
        "sqlls",
        "tailwindcss",
        "rust_analyzer",
        "clangd",
        "zls",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "biome",
        "shellcheck",
        "stylua",
        "shfmt",
        "shellcheck",
        "goimports",
        "gomodifytags",
        "gotests",
      },
      handlers = {
        taplo = function() end, -- disable taplo in null-ls, it's taken care of by lspconfig
      },
    },
  },
}

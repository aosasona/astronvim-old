-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

---@type LazySpec
return {
  "AstroNvim/astrolsp",

  ---@class opts AstroLSPOpts
  opts = {
    features = {
      autoformat = true, -- enable or disable auto formatting on start
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = true, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- (Auto)formatting
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = {
          -- enable format on save for specified filetypes only
        },
        ignore_filetypes = { "sql" },
      },
      disabled = {
        -- disable formatting capabilities for the listed language servers
      },
      timeout_ms = 1500, -- default format timeout
    },
    -- Language servers
    servers = {
      -- "clangd",
      "glas",
      "gleam",
      "psalmls",
    },

    setup_handlers = {
      -- add custom handler
      -- jdtls = function(_, opts)
      --   vim.api.nvim_create_autocmd("Filetype", {
      --     pattern = "java", -- autocmd to start jdtls
      --     callback = function()
      --       if opts.root_dir and opts.root_dir ~= "" then require("jdtls").start_or_attach(opts) end
      --     end,
      --   })
      -- end,
    },

    -- LSP configuration
    config = {
      -- clangd = {
      --   capabilities = vim.lsp.protocol.make_client_capabilities(),
      --   cmd = {
      --     "clangd",
      --     "--offset-encoding=utf-16",
      --     "--background-index",
      --     "--clang-tidy",
      --     "--cross-file-rename",
      --     "--fallback-style=Google",
      --     "--enable-config",
      --     "--header-insertion=iwyu",
      --     "-j=4",
      --     "--suggest-missing-includes",
      --     "--header-insertion=iwyu",
      --     "--completion-style=detailed",
      --   },
      --   root_dir = function(fname)
      --     local root_files = {
      --       ".clangd",
      --       ".clang-tidy",
      --       ".clang-format",
      --       "compile_commands.json",
      --       "compile_flags.txt",
      --       "build.sh", -- buildProject
      --       "configure.ac", -- AutoTools
      --       "run",
      --       "compile",
      --       "build.zig", -- using zig as a build system
      --     }
      --
      --     return require("lspconfig.util").root_pattern(unpack(root_files))(fname)
      --       or require("lspconfig.util").path.dirname(fname)
      --   end,
      --   filetypes = { "c", "cc", "cxx", "cpp", "objc", "objcpp" },
      --   single_file_support = true,
      -- },

      clangd = {
        capabilities = {
          offsetEncoding = "utf-8",
        },
        filetypes = { "c", "cc", "cxx", "cpp", "objc", "objcpp" },
      },

      -- Glas for Gleam language
      glas = {
        cmd = { "glas", "--stdio" },
        capabilities = vim.lsp.protocol.make_client_capabilities(),
        root_dir = require("lspconfig.util").root_pattern "gleam.toml",
        filetypes = { "gleam" },
        single_file_support = true,
      },

      -- Extended Gopls
      gopls = {
        settings = {
          gopls = {
            staticcheck = true,
          },
        },
      },

      -- Psalm for PHP
      psalmls = {
        cmd = { "psalm-language-server" },
        capabilities = vim.lsp.protocol.make_client_capabilities(),
        root_dir = require("lspconfig.util").root_pattern("psalm.xml", "psalm.xml.dist"),
        filetypes = { "php" },
        single_file_support = true,
      },
    },

    -- autocmds = {
    --   -- first key is the `augroup` to add the auto commands to (:h augroup)
    --   lsp_document_highlight = {
    --     -- Optional condition to create/delete auto command group
    --     -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
    --     -- condition will be resolved for each client on each execution and if it ever fails for all clients,
    --     -- the auto commands will be deleted for that buffer
    --     cond = "textDocument/documentHighlight",
    --     -- cond = function(client, bufnr) return client.name == "lua_ls" end,
    --     -- list of auto commands to set
    --     {
    --       -- events to trigger
    --       event = { "CursorHold", "CursorHoldI" },
    --       -- the rest of the autocmd options (:h nvim_create_autocmd)
    --       desc = "Document Highlighting",
    --       callback = function() vim.lsp.buf.document_highlight() end,
    --     },
    --     {
    --       event = { "CursorMoved", "CursorMovedI", "BufLeave" },
    --       desc = "Document Highlighting Clear",
    --       callback = function() vim.lsp.buf.clear_references() end,
    --     },
    --   },
    -- }
    --
    -- mappings = {
    --   n = {
    --     gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
    --     -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
    --     gD = {
    --       function() vim.lsp.buf.declaration() end,
    --       desc = "Declaration of current symbol",
    --       cond = "textDocument/declaration",
    --     },
    --     ["<Leader>uY"] = {
    --       function() require("astrolsp.toggles").buffer_semantic_tokens() end,
    --       desc = "Toggle LSP semantic highlight (buffer)",
    --       cond = function(client) return client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens end,
    --     },
    --   },
    -- }
  },
}

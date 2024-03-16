return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "gruvbox-material",
  -- colorscheme = "primer_dark",
  -- colorscheme = "catppuccin",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
      "glas",
      "psalmls",
    },
    config = {
      clangd = function()
        ---@class lsp.ClientCapabilities
        local cap = vim.lsp.protocol.make_client_capabilities()
        local util = require "lspconfig.util"
        cap.offsetEncoding = { "utf-16" }

        local root_files = {
          ".clangd",
          ".clang-tidy",
          ".clang-format",
          "compile_commands.json",
          "compile_flags.txt",
          "build.sh", -- buildProject
          "configure.ac", -- AutoTools
          "run",
          "compile",
          "build.zig", -- using zig as a build system
        }

        return {
          capabilities = cap,
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--cross-file-rename",
            "--fallback-style=Google",
            "--enable-config",
            "--header-insertion=iwyu",
            "-j=4",
            "--suggest-missing-includes",
            "--header-insertion=iwyu",
          },
          root_dir = function(fname) return util.root_pattern(unpack(root_files))(fname) or util.path.dirname(fname) end,
          filetypes = { "c", "cc", "cxx", "cpp", "objc", "objcpp" },
          single_file_support = true,
        }
      end,
      glas = function()
        ---@class lsp.ClientCapabilities
        return {
          cmd = { "glas", "--stdio" },
          capabilities = vim.lsp.protocol.make_client_capabilities(),
          root_dir = require("lspconfig.util").root_pattern "gleam.toml",
          filetypes = { "gleam" },
          single_file_support = true,
        }
      end,
      psalmls = function()
        ---@class lsp.ClientCapabilities
        return {
          cmd = { "psalm-language-server" },
          capabilities = vim.lsp.protocol.make_client_capabilities(),
          root_dir = require("lspconfig.util").root_pattern("psalm.xml", "psalm.xml.dist"),
          filetypes = { "php" },
          single_file_support = true,
        }
      end,
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

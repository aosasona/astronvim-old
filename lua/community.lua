-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.completion.copilot-lua-cmp" },

  -- Language and framework support packs
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.cs" },
  { import = "astrocommunity.pack.elixir-phoenix" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.kotlin" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.zig" },

  -- Colorschemes
  { import = "astrocommunity.colorscheme.bamboo-nvim" },
  { import = "astrocommunity.colorscheme.mellow-nvim" },
  { import = "astrocommunity.colorscheme.monokai-pro-nvim" },

  -- Editing support
  { import = "astrocommunity.editing-support.vim-move" },
  { import = "astrocommunity.editing-support.vim-visual-multi" },
}

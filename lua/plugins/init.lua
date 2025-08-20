local Plugs = {
  { "MunifTanjim/nui.nvim" },
  { "nvim-lua/plenary.nvim" },
  {
    "karb94/neoscroll.nvim",
    opts = {},
  },
  -- UTILS
  { lazy = true, "mracos/mermaid.vim" },
  { "b0o/schemastore.nvim" },
  "sharkdp/fd",
  "BurntSushi/ripgrep",
  -- THEMES
  { "nvim-tree/nvim-web-devicons" },
  { lazy = true, "Lewiky/moonokai" },
  { "titanzero/zephyrium" },
  -----
  { "darkvoid-theme/darkvoid.nvim" },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      disable_mouse = false,
      disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil", "aerial", "dbui", "dbout" },
    },
  },
}

return Plugs

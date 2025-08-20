local Plug = { "nvim-treesitter/nvim-treesitter" }

Plug.dependencies = {
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "LiadOz/nvim-dap-repl-highlights" },
}
Plug.build = ":TSUpdate"
Plug.lazy = false
-- See :help nvim-treesitter-modules
Plug.opts = {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ao"] = "@block.outer", -- Use this for objects
        ["io"] = "@block.inner", -- Use this for inner objects
      },
    },
  },

  -- rainbow = { enable = true },
  autotag = { enabled = true },
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "json",
    "yaml",
    "toml",
    "markdown",
    "git_config",
    "gitcommit",
    "git_rebase",
    "gitignore",
    "gitattributes",
    "json",
    "json5",
    "jsonc",
    "bash",
  },
}

function Plug.config(name, opts)
  require("nvim-treesitter.configs").setup(opts)
  require("nvim-dap-repl-highlights").setup()
  vim.treesitter.language.register("bash", "zsh")
end

return Plug

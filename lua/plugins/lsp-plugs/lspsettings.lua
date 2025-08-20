local helpers = require("helpers")
local keymaps = require("user.keymaps.lsp-keymaps")

local servers_configs = require("user.lsp.servers.servers")
local default = require("user.lsp.default-installed")

local Plug = { "neovim/nvim-lspconfig" }

local on_attach = function(ev)
  vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
  helpers.parse_key_map(keymaps.attach(ev.buf))
end

Plug.dependencies = {
  { "hrsh7th/cmp-nvim-lsp" },
  { "mason-org/mason-lspconfig.nvim" },
  { "folke/neodev.nvim", opts = {} },
}

Plug.cmd = { "LspInfo", "LspInstall", "LspUnInstall" }

Plug.event = { "BufReadPre", "BufNewFile" }
function Plug.on_attach() end

Plug.opts = {
  ui = {
    windows = {
      default_options = {
        border = "rounded",
      },
    },
  },
}

function Plug.config()
  helpers.parse_key_map(keymaps.lspconfig)

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = on_attach,
  })
  require("mason-lspconfig").setup({
    ensure_installed = default.lsp,
    automatic_installation = true,
    automatic_enable = true,
    handlers = (function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lsp_servers = {}
      for _, server in pairs(servers_configs) do
        server.opts.capabilities = capabilities
        -- if server.opts.root_dir ~= nil then
        --   server.opts.root_dir = require("lspconfig.util").root_pattern(unpack(server.opts.root_dir))
        -- end
        lsp_servers[server.name] = require("lspconfig")[server.name].setup(server.opts)
      end
      return lsp_servers
    end)(),
  })
end
return Plug

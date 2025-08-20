local helpers = require("helpers")
vim.g.mapleader = ","

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.cmd("wincmd J")
    vim.api.nvim_buf_set_keymap(0, "n", "ca", "", {
      noremap = true,
      silent = true,
      callback = function()
        -- Get the current line item from quickfix
        local qf_item = vim.fn.getqflist()[vim.fn.line(".")]

        -- Jump to the file and position
        vim.cmd(string.format("edit +%d %s", qf_item.lnum, qf_item.filename))

        -- Trigger code action at this position
        vim.lsp.buf.code_action()
      end,
      desc = "Trigger code action for quickfix item",
    })
  end,
})

vim.api.nvim_create_augroup("MakeConfig", { clear = true })


local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end
helpers.parse_key_map(require("user.keymaps.neovim"))
-- vimgrep
-- cfdo %s//gj
require("user.plugins")
require("user.commands")
require("user.customcommands")
require("user.config")

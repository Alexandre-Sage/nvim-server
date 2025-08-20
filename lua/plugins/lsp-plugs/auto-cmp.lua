local Plug = { "hrsh7th/nvim-cmp" }
Plug.dependencies = {
	{ "Alexandre-Sage/curl-nvim-cmp" },
	{ "hrsh7th/cmp-cmdline" },
	{ "SergioRibera/cmp-dotenv" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-nvim-lsp" },
	-- Ensure LuaSnip build step is here
}

Plug.event = "InsertEnter"

function Plug.config()
	local cmp = require("cmp")
	local compare = cmp.config.compare


	cmp.setup({
		sorting = {
			priority_weight = 1.0,
			comparators = {
				compare.offset,
				compare.exact,
				compare.score,
				compare.recently_used,
				compare.locality,
				compare.kind,
				compare.sort_text,
				compare.length,
			},
		},
		sources = {
			{ name = "nvim_lsp", priority = 1100 },
			{ name = "buffer",   priority = 500 },
			{ name = "path",     priority = 250 },
			{ name = "dotenv" },
			-- { name = "ts_repl" },
		},
		view = {
			entries = {
				name = "custom",
				selection_order = "top_down",
			},
			docs = {
				auto_open = true,
			},
		},
		mapping = cmp.mapping.preset.insert({
			["<C-d>"] = cmp.mapping.scroll_docs(-4), -- Up
			["<C-u>"] = cmp.mapping.scroll_docs(4), -- Down
			["<tab>"] = cmp.mapping.select_next_item(),
			["<C-a>"] = cmp.mapping.select_prev_item(),
			["<C-Space>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
		}),
	})
	require("cmp").setup.filetype({ "curl" }, {
		sources = {
			{ name = "curl" },
			{ name = "dotenv" },
		},
	})
	vim.lsp.handlers["textDocument/diagnostic"] = vim.lsp.with(vim.lsp.diagnostic.on_diagnostic, {
		underline = true,
		virtual_text = {
			spacing = 4,
		},
		signs = function(namespace, bufnr)
			return vim.b[bufnr].show_signs == true
		end,
		update_in_insert = true,
	})
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline({ -- ["<C-o>"] = cmp.mapping.scroll_docs(-4), -- Up
			-- ["<C-p>"] = cmp.mapping.scroll_docs(4), -- Down
			-- ["<tab>"] = cmp.mapping.select_next_item(),
			-- ["<C-a>"] = cmp.mapping.select_prev_item(),
			-- ["<C-Space>"] = cmp.mapping.complete(),
			-- ["<CR>"] = cmp.mapping.confirm({
			--   behavior = cmp.ConfirmBehavior.Replace,
			--   select = true,
			-- }),
		}),
		sources = cmp.config.sources({
			{ name = "path",   priority = 1 },
			-- { name = "dotenv", priority = 3 },
			{ name = "buffer", priority = 2 },
		}, {
			{
				name = "cmdline",
				option = {
					ignore_cmds = { "Man", "!" },
				},
			},
		}),
	})
	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline({ -- ["<C-o>"] = cmp.mapping.scroll_docs(-4), -- Up
			-- ["<C-p>"] = cmp.mapping.scroll_docs(4), -- Down
			["<tab>"] = cmp.mapping.select_next_item(),
			["<C-a>"] = cmp.mapping.select_prev_item(),
			-- ["<C-Space>"] = cmp.mapping.complete(),
			-- ["<CR>"] = cmp.mapping.confirm({
			--   behavior = cmp.ConfirmBehavior.Replace,
			--   select = true,
			-- }),
		}),
		sources = {
			{ name = "buffer" },
			-- { name = "dotenv" },
		},
	})
end

return Plug

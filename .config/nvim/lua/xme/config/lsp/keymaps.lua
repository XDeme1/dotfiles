local telescope = require("telescope.builtin")
local map = vim.keymap

return function(_, bufnr)
	local opts = { buffer = bufnr, remap = false, silent = true }

	map.set("n", "gD", function()
		vim.lsp.buf.declaration()
	end, { buffer = bufnr, silent = true, desc = "Declaration" })
	map.set("n", "gd", function()
		telescope.lsp_definitions()
	end, { buffer = bufnr, silent = true, desc = "Definitions" })
	map.set("n", "gr", function()
		telescope.lsp_references()
	end, { buffer = bufnr, silent = true, desc = "References" })
	map.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, silent = true, desc = "Next diagnostic" })
	map.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, silent = true, desc = "Previous diagnostic" })
	map.set(
		"n",
		"<leader>ld",
		vim.diagnostic.open_float,
		{ buffer = bufnr, silent = true, desc = "Show diagnostics" }
	)

	map.set("n", "<c-Space>", function()
		vim.lsp.buf.hover()
	end, opts)
	map.set("n", "<F2>", function()
		vim.lsp.buf.rename()
	end, opts)

	map.set("n", "<leader>ll", function()
		vim.lsp.codelens.run()
	end, { buffer = bufnr, silent = true, desc = "Code lens" })
	map.set("n", "<leader>la", function()
		vim.lsp.buf.code_action()
	end, { buffer = bufnr, silent = true, desc = "Code actions" })
end


-- Configure lsp information display style
local M = {}

M.setup = function()
	-- replace the lsp info symbol
	local signs = {
		{ name = "DiagnosticSignError", text = "E" },
		{ name = "DiagnosticSignWarn", text = "W" },
		{ name = "DiagnosticSignHint", text = "H" },
		{ name = "DiagnosticSignInfo", text = "I" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local function format(diagnostic)
		if diagnostic.severity == vim.diagnostic.severity.ERROR then
			return string.format("Error: %s", diagnostic.message)
		elseif diagnostic.severity == vim.diagnostic.severity.WARN then
			return string.format("WARN: %s", diagnostic.message)
		end
		return diagnostic.message
	end

	-- set the style of lsp info
	local config = {
		-- the message show after the current line.
		virtual_text = {
			format = format,
			spacing = 4,
			prefix = "",
		},
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		-- Use a sharp border with `FloatBorder` highlights
		border = "rounded",
		-- add the title in hover float window
		title = "hover",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		-- Use a sharp border with `FloatBorder` highlights
		border = "rounded",
	})
end

return M

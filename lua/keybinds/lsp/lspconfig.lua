local map = vim.keymap.set

local function toggle_diagnostics()
	if vim.diagnostic.config().virtual_text then
		vim.diagnostic.config({ virtual_text = false })
	else
		vim.diagnostic.config({ virtual_text = true })
	end
end
local function toggle_inlayhints()
	if vim.lsp.inlay_hint.is_enabled() then
		vim.lsp.inlay_hint.enable(false)
	else
		vim.lsp.inlay_hint.enable(true)
	end
end

map("n", "<leader>lv", vim.lsp.buf.format)
map("n", "<leader>ld", toggle_diagnostics)
map("n", "<leader>li", toggle_inlayhints)

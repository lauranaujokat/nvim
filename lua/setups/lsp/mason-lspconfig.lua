local map = vim.keymap.set
local capabilities = {
    require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
}
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
}
local on_attach = function(_, bufnr)
    require("lsp_signature").on_attach(signature_setup, bufnr)
end
local on_attach_rust = function(_, bufnr)
    vim.keymap.set("n", "<C-space>", "<cmd>RustHoverActions<cr>")
    require("lsp_signature").on_attach(signature_setup, bufnr)
end


-- Update this path
local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.9.2-universel/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb'
local this_os = vim.loop.os_uname().sysname;

-- The path in windows is different
if this_os:find "Windows" then
    codelldb_path = extension_path .. "adapter\\codelldb.exe"
    liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
else
    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end



require("mason-lspconfig").setup({})
require("mason-lspconfig").setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            handlers = handlers,
            on_attach = on_attach
        })
    end,
    ["tsserver"] = function()
        require("lspconfig")["tsserver"].setup({
            capabilities = capabilities,
            handlers = handlers,
            on_attach = on_attach,
            filetypes = { "javascript" },
            root_dir = require("lspconfig").util.root_pattern("package.json")
        })
    end,
    ["opencl_ls"] = function()
        require("lspconfig")["opencl_ls"].setup({
            capabilities = capabilities,
            handlers = handlers,
            on_attach = on_attach,
            filetypes = { "opencl" },
        })
    end,
    ["rust_analyzer"] = function()
        require("rust-tools").setup({
            server = {
                dap = {
                    adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
                },
                capabilities = capabilities,
                handlers = handlers,
                on_attach = on_attach_rust,
            },
        })
    end
})
require("lspconfig").glslls.setup({
    capabilities = capabilities,
    handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
    },
    filetypes = { "glsl" }
})

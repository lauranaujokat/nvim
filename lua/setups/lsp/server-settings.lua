return {
    asm_lsp = {
        cmd = {"asm-lsp"},
        filetypes = {"asm", "vmasm"},
        root_markers = {".asm-lsp.toml", ".git"},
    },

	clangd = {
		capabilities = {
			offsetEncoding = { "utf-8", "utf-16" },
			textDocument = {
				completion = {
					editsNearCursor = true
				}
			}
		},
		cmd = { "clangd" },
		format = { "clang-format" },
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
		root_markers = { ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git" },
	},
	eslint = {
		cmd = { "/usr/bin/eslint" },
	},
	lua_ls = {
		cmd = { "/usr/bin/lua-language-server" },
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				format = {
					command = { "stylua" },
				},
			},
		},
	},
	ts_ls = {
		cmd = { "/usr/bin/typescript-language-server", "--stdio" },
		filetypes = { "js", "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	},
}

vim.keymap.set("n", "<Leader>dt", "<cmd>DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<Leader>dx", "<cmd>DapTerminate<CR>")
vim.keymap.set("n", "<Leader>do", "<cmd>DapStepOver<CR>")
vim.keymap.set("n", "<Leader>di", "<cmd>DapStepInto<CR>")
vim.keymap.set("n", "<Leader>du", "<cmd>DapStepOut<CR>")
vim.keymap.set("n", "<Leader>dn", "<cmd>DapContinue<CR>")
vim.keymap.set("n", "<leader>de", require("dapui").eval)
vim.keymap.set("n", "<leader>df", require("dapui").float_element)
vim.keymap.set("n", "<leader>dd", require("dapui").toggle)

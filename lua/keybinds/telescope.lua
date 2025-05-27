local map = vim.keymap.set
map("n", "<leader>ff", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope file_browser<cr>")

vim.keymap.set("n", "<c-n>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<c-o>", ":NvimTreeToggle<CR>")

vim.api.nvim_set_keymap("v", "<Tab>", ">", { noremap = true })

vim.keymap.set("n", "<a-TAB>", ":tabnew<CR>")
vim.keymap.set("n", "<c-TAB>", ":tabnew<CR>")
vim.keymap.set("n", "<c-w>", ":tabclose<CR>")
vim.keymap.set("n", "<c-q>", ":tabclose<CR>")
vim.keymap.set("n", "<TAB>", ":tabnext<CR>")
vim.keymap.set("n", "<s-TAB>", ":tabprevious<CR>")

--vim.keymap.set("n", "<a-t>", ":ToggleTerm<CR>")
--vim.keymap.set("n", "<c-t>", ":ToggleTerm<CR>")
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<a-o>', builtin.find_files, {})
vim.keymap.set('n', '<c-f>', function()
require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
	winblend = 10,
	previewer = false,
})
end, {desc = '[/] Fuzzily search in current file' })

vim.keymap.set("c", "Q", "qa")

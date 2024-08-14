vim.keymap.set("n", "<c-n>", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<c-o>", "<cmd>NvimTreeToggle<CR>")

vim.api.nvim_set_keymap("v", "<Tab>", ">", { noremap = true })

vim.keymap.set("n", "<a-TAB>", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<c-TAB>", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<c-q>", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<TAB>", "<cmd>tabnext<CR>")
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
end, {desc = 'Fuzzily search in current file' })

vim.keymap.set("c", "Q", "qa")


-- Open compiler
vim.api.nvim_set_keymap('n', '<F6>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_set_keymap('n', '<F5>',
     "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
  .. "<cmd>CompilerRedo<cr>",
 { noremap = true, silent = true })

-- Toggle compiler results
vim.api.nvim_set_keymap('n', '<F4>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

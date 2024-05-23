vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    sort = {
        sorter = 'extension',
    },
})

vim.keymap.set('n', '<C-`>', ':NvimTreeFindFileToggle<CR>')



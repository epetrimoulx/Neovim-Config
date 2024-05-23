require("core.keymaps")
require("core.plugins")
require("core.plugin_config")
require("mason").setup()

vim.wo.number = true
vim.api.nvim_set_hl(0, 'LineNr', { fg='NONE', bold = false, italic = true })
vim.api.nvim_set_hl(0, 'CursorLineNr', {fg = 'white', bold = false })
vim.api.nvim_set_hl(0, 'Comment', { fg = '#808080', italic = true }) -- Set comment color and make it italic
vim.cmd('highlight Normal guibg=rgba:0000/0000/0000/80')

-- Correct the syntac highlighting for CMakelists.txt --
vim.cmd('au BufNewFile,BufRead CMakeLists.txt set filetype=cmake')

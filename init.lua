require("core.keymaps")
require("core.plugins")
require("core.plugin_config")
require("mason").setup()

vim.wo.number = true
vim.api.nvim_set_hl(0, 'LineNr', { fg='NONE', bold = false })
vim.api.nvim_set_hl(0, 'CursorLineNr', {fg = 'white', bold = false })


vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

function ToggleTermAndInsert()
  vim.cmd('ToggleTerm')  -- Open the terminal
  vim.cmd('startinsert')  -- Enter insert mode
end

vim.api.nvim_set_keymap('n', '<C-t>', ':lua ToggleTermAndInsert()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-t>', '<C-\\><C-n>:ToggleTerm<CR>', { noremap = true, silent = true })
vim.cmd([[
  augroup Terminal
    autocmd!
    autocmd TermClose * lua vim.api.nvim_input('<CR>')
  augroup END
]])

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})

function LiveGrepWholeWord()
  builtin.live_grep({
    additional_args = function(opts)
      return {"--word-regexp"}
    end
  })
end

vim.api.nvim_set_keymap('n', '<leader>fw', [[<cmd>lua LiveGrepWholeWord()<CR>]], { noremap = true, silent = true })

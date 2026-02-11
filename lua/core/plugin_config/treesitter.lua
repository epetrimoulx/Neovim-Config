require('nvim-treesitter.configs').setup({
  ensure_installed = { 
    "c", 
    "lua", 
    "rust", 
    "ruby", 
    "vim", 
    "fortran", 
    "cpp", 
    "python", 
    "typescript", 
    "javascript", 
    "css", 
    "html", 
    "razor", 
    "c_sharp"
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },
})

vim.treesitter.language.register('razor', 'razor')
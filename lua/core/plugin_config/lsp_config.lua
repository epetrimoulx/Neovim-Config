require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
      "lua_ls",
      "fortls",
      "pyright",
      "omnisharp",
      "sqlls",
      "html",
      "cssls",
      "ts_ls",
      "clangd",
  },
  automatic_installation = false,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local lspconfig = require('lspconfig')

-- Lua Language Server
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  },
})

-- Fortran Language Server
lspconfig.fortls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Clangd (C/C++)
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Pyright (Python)
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

 -- OmniSharp (C# and Razor)
lspconfig.omnisharp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  
  -- Explicitly set the command to prevent lspconfig from adding settings as CLI args
  cmd = { 
    vim.fn.stdpath("data") .. "/mason/bin/omnisharp",
    "--languageserver",
    "--hostPID",
    tostring(vim.fn.getpid())
  },
  
  filetypes = { 'cs', 'vb', 'razor' },
  root_dir = lspconfig.util.root_pattern('*.sln', '*.csproj', '.git'),
  
  -- Enable Roslyn analyzers via init_options instead of settings
  init_options = {
    RoslynExtensionsOptions = {
      EnableAnalyzersSupport = true,
      EnableImportCompletion = true,
    },
  },
})

-- SQL Language Server
lspconfig.sqlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- HTML Language Server
lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html' },
})

-- CSS Language Server
lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- TypeScript/JavaScript
lspconfig.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

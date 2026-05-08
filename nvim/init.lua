require("set")
require("lsp")
require('diagnostics')
require('keymap')

vim.pack.add{
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
    { src = 'https://github.com/mofiqul/dracula.nvim' },
    --{ src = 'https://github.com/ellisonleao/gruvbox.nvim' },
}

require('theme')

require("mason").setup()
require("mason-lspconfig").setup({
    -- Automatically install these servers if they aren't present
    ensure_installed = { "lua_ls", "clangd", "pyright" },
})


vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "CursorMoved", "BufLeave", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})



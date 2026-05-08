vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('pyright')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- Check if the server supports completion
    if client:supports_method('textDocument/completion') then
      -- Enable native completion for the current buffer
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end
})

vim.lsp.config['lua_ls'] = {
   cmd = { 'lua-language-server' },
   filetypes = { 'lua' },
   root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            }
        }
    }
}

vim.lsp.config['clangd'] = {
    cmd = {'clangd'},
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
}

vim.lsp.config['pyright'] = {
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
            },
        },
    },
}

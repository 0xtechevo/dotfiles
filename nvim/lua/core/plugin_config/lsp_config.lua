local nvim_lsp = require'lspconfig'

local on_attach = function(client)
    require'completion'.on_attach(client)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, {buffer=0})
end


nvim_lsp.lua_ls.setup({})

-- nvim_lsp.rust_analyzer.setup({
nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

nvim_lsp.pylsp.setup({})

nvim_lsp.marksman.setup({})

-- nvim.lsp.pylsp.setup({})

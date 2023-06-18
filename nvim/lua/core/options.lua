vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.cmd('colorscheme tokyonight')
vim.cmd('set relativenumber')
vim.cmd('set number')
vim.cmd('set cursorline')
vim.cmd('set cursorlineopt=number')
-- vim.cmd('setlocal spell spelllang=en_gb')
vim.api.nvim_command([[au FileType *.md setl spellland=en_gb]])

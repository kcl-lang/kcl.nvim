vim.api.nvim_command([[autocmd FileType kcl set nofoldenable]])
vim.api.nvim_command([[autocmd FileType kcl set foldmethod=syntax]])

vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4

vim.bo.commentstring = "#%s"

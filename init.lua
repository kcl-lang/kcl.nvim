require('lsp')

vim.api.nvim_command [[autocmd BufRead,BufNewFile *.k   set filetype=kcl]]
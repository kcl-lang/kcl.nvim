-- 是否将 tab 替换为 space
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
-- 取消自动注释，当前行是注释时，按下回车键会默认添加一行注释，这里取消这一行为
-- vim.opt_local.formatoptions = vim.opt_local.formatoptions - {"r", "c", "o"}

vim.api.nvim_command [[autocmd BufRead,BufNewFile *.k   set filetype=kcl]]

--代码块折叠快捷键: zC-折叠 zO-展开 zM-全部折叠  zR-全部展开
vim.api.nvim_command [[autocmd FileType kcl set nofoldenable]]
vim.api.nvim_command [[autocmd FileType kcl set foldmethod=syntax]]
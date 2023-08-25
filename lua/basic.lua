--- map .k file to filetype "kcl"
vim.filetype.add({
	extension = {
		k = "kcl",
	},
})

--代码块折叠快捷键: zC-折叠 zO-展开 zM-全部折叠  zR-全部展开
vim.api.nvim_command([[autocmd FileType kcl set nofoldenable]])
vim.api.nvim_command([[autocmd FileType kcl set foldmethod=syntax]])

vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4

vim.bo.commentstring = "#%s"

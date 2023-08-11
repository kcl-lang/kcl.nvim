require("lsp.handlers").setup()

-- Setup language servers.
function check_start_kcl_lsp()
  local kcl_lsp_config = {
    name = 'kcl-cli',
    cmd = {'kcl-language-server'},
    filetypes = { 'k' }
  }
  local client_id = vim.lsp.start(kcl_lsp_config)
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.buf_attach_client(bufnr, client_id)
end

vim.api.nvim_command [[autocmd BufReadPost,BufNewFile * lua check_start_kcl_lsp()]]


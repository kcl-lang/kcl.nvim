require("lsp.handlers").setup()

-- Some path manipulation utilities
local function is_dir(filename)
	local stat = vim.loop.fs_stat(filename)
	return stat and stat.type == "directory" or false
end
local path_sep = vim.loop.os_uname().sysname == "Windows" and "\\" or "/"
-- Assumes filepath is a file.
local function dirname(filepath)
	local is_changed = false
	local result = filepath:gsub(path_sep .. "([^" .. path_sep .. "]+)$", function()
		is_changed = true
		return ""
	end)
	return result, is_changed
end
local function path_join(...)
	return table.concat(vim.tbl_flatten({ ... }), path_sep)
end
-- Ascend the buffer's path until we find the rootdir.
-- is_root_path is a function which returns bool
local function buffer_find_root_dir(bufnr, is_root_path)
	local bufname = vim.api.nvim_buf_get_name(bufnr)
	if vim.fn.filereadable(bufname) == 0 then
		return nil
	end
	local dir = bufname
	-- Just in case our algorithm is buggy, don't infinite loop.
	for _ = 1, 100 do
		local did_change
		dir, did_change = dirname(dir)
		if is_root_path(dir, bufname) then
			return dir, bufname
		end
		-- If we can't ascend further, then stop looking.
		if not did_change then
			return nil
		end
	end
end

local kcl_lsps = {}
local kcl_lsp_config = {
	name = "kcl-cli",
	cmd = { "kcl-language-server" },
	filetypes = { "k" },
}

-- Setup language servers.
function check_start_kcl_lsp()
	local bufnr = vim.api.nvim_get_current_buf()
	local root_dir = buffer_find_root_dir(bufnr, function(dir)
		return vim.fn.filereadable(path_join(dir, "main.k")) == 1
	end)

	local client_id
	if not root_dir then
		-- single file mode
		client_id = vim.lsp.start_client(kcl_lsp_config)
	else
		-- Check if we have a client already or start and store it.
		client_id = kcl_lsps[root_dir]
		if not client_id then
			local new_config = vim.tbl_extend("error", kcl_lsp_config, {
				root_dir = root_dir,
			})
			client_id = vim.lsp.start_client(new_config)
			kcl_lsps[root_dir] = client_id
		end
	end
	-- Finally, attach to the buffer to track changes. This will do nothing if we
	-- are already attached.
	vim.lsp.buf_attach_client(bufnr, client_id)
end

vim.api.nvim_command([[autocmd BufNewFile,BufRead * lua check_start_kcl_lsp()]])

vim.cmd('lua check_start_kcl_lsp()')
local function comment(s)
	return "# " .. s
end

local function uncomment(s)
	return s:gsub("^#(%s*)", "", 1)
end

function toggle_line_comment()
	local currentline = vim.api.nvim_get_current_line()
	local spaces = string.match(currentline, "^(%s*)")
	local currentstr = currentline:gsub(spaces, "")
	if currentstr:sub(1, 1) == "#" then
		vim.api.nvim_set_current_line(spaces .. uncomment(currentstr))
	else
		vim.api.nvim_set_current_line(spaces .. comment(currentstr))
	end
end

vim.keymap.set("i", "<C-\\>", toggle_line_comment)

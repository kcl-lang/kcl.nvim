-- 注释
local function comment(s)
    return '# '..s
end

-- 反注释
local function uncomment(s)
    return s:gsub('^#(%s*)', '', 1)
end

function toggle_line_comment ()
    local currentline = vim.api.nvim_get_current_line()
    -- 匹配字符串前空格
    local spaces = string.match(currentline, "^(%s*)")
    -- 去除字符串前空格
    local currentstr = currentline:gsub(spaces, '')
    if currentstr:sub(1,1) == '#' then
        -- 执行反注释
        vim.api.nvim_set_current_line(spaces..uncomment(currentstr))
    else
        -- 执行注释
        vim.api.nvim_set_current_line(spaces..comment(currentstr))
    end
end

-- 切换行注释快捷键：Ctrl+\ 
vim.keymap.set("i", "<C-\\>", toggle_line_comment)
-- 去除字符串前空格
local function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

-- 计算字符串前空格个数
local function count_spaces_at_start(str)
    local spaces = string.match(str, "^(%s*)")
    if spaces then
        return string.len(spaces)
    else
        return 0
    end
end

-- 注释
local function comment(s)
    return '# '..s
end

-- 反注释
local function uncomment(s)
    return trim(s:gsub('#', '', 1))
end

function switch_commented ()
    local currentline = vim.api.nvim_get_current_line()
    local space_len = count_spaces_at_start(currentline)

    local currentstr = trim(currentline)
    if currentstr:sub(1,1) == '#' then
        -- 执行反注释
        vim.api.nvim_set_current_line(string.rep(' ', space_len)..uncomment(currentstr))
    else
        -- 执行注释
        vim.api.nvim_set_current_line(string.rep(' ', space_len)..comment(currentstr))
    end
end

-- 切换注释
vim.keymap.set("i", "<C-\\>", switch_commented)
--Utils.lua

function table.len(t)
    local leng=0
    for k, v in pairs(t) do
        leng=leng+1
    end
    return leng;
end

function CreatEnumTable(tbl, index) 
    if type(tbl) ~= 'table' then
        return
    end
    local enumtbl = {} 
    local enumindex = index or 0 
    for i, v in ipairs(tbl) do 
        enumtbl[v] = enumindex + i 
    end 
    return enumtbl 
end

function isDigit(ch)
	local ret = tonumber(ch)
	if not ret then
		return false
	end
	return true
end

function isAlpha(ch)
	if ch >= 'a' and ch <= 'z' then
		return true
	end

	if ch >= 'A' and ch <= 'Z' then
		return true
	end

	return false
end

function isChinese(ch)
	local b = string.byte(ch)
	if b > 127 then
		return true
	end
	return false
end

function isBlank(ch)
    if ch == ' ' or ch == '\t' or ch == '\n' then
        return true
    end
    return false
end
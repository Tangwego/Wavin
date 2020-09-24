-- String.lua
require "lib.base"

String = Class()

local str = nil

function String:ctor(value)
	self.str = value
	if type(self.str) ~= "string" then
		self.str = ""
	end
	return self.str
end

function String:length()
	local len = string.len(self.str)
	local cnt = 0
	local tmp = 0
	for i=1,len do
		local b = string.byte(self.str,i,i)
		local c = string.sub(self.str,i,i)
		if b > 127 then
			tmp = tmp + 1
		elseif c == '\t' or c == '\n' then
		else
			cnt = cnt + 1
		end
		if tmp == 2 then
			tmp = 0
			cnt = cnt + 1
		end
	end
	return cnt 
end

function String:get(index)
	return string.sub(self.str, index, index)
end

function String:indexOf(value)
	local s,e = string.find(self.str,value)
	if not s then
		return -1
	end
	return s
end

function String:concat(object)
	self.str = tostring(self.str)..tostring(object)
	return self.str
end

function String:append(object)
	self.str = tostring(self.str)..tostring(object)
	return self.str
end

function String:isEmpty()
	return string.len(self.str) == 0
end

function String:contains(object)
	local s,e = string.find(self.str,object)

	if not s and not e then
		return false
	end
	return true
end

function String:split(operator)
	local tab = {}
	local wear = 0
	local tmp = self.str
	local swap = nil
	local i = 1
	while true do
		local s,e = string.find(tmp,operator)
		if not s or not e then
			if tmp ~= "" and tmp ~= " " then
				tab[i] = tmp
				i = i + 1
				break
			end
		end
		wear = e - 1
		swap = string.sub(tmp,0,wear)
		if swap ~= "" and swap ~= " " then
			tab[i] = swap
			i = i + 1
		end
		local len = string.len(tmp)
		tmp = string.sub(tmp,wear+2,len)
	end
	return tab
end

function String:display()
	print(self.str)
end

function String:equals(object)
	if object == self.str then
		return true
	end
	return false
end

function String:trim()
	local tmp = nil
	local ret = ""
	local len = string.len(self.str)
	for i=0,len do
		tmp = string.sub(self.str,i,i)
		if tmp ~= " " then
			ret = ret..tmp
		end
	end
	return ret
end

function String:clear()
	self.str = ""
end

function String:free()
	if not self.str then
		self.str = nil
		return
	end
	self.str = nil
end

function String:toString()
	return tostring(self.str)
end

return String
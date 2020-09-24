-- List.lua
require "lib.base"

List = Class()

local tab = nil
function List:ctor(value)
	self.tab = value
	if type(self.tab) ~= "table" then
		self.tab = {}
		return
	end
	self.tab = value
end

function List:add(index,object)
	if type(index) == "number" then
		if index <= 0 then
			index = self:size() + 1
		end
		table.insert(self.tab,index,object)
	else
		table.insert(self.tab,object)
	end
end

function List:remove(index)
	if type(index) == "number" then
		local tmp = List.copy()
		self.tab = {}
		local loc = 1
		for _,value in ipairs(tmp) do
			if loc == index then
				loc = loc + 1
			else
				self.tab[loc] = value
				loc = loc + 1
			end
		end
	else
		table.remove(self.tab)
		return true
	end
end

function List:get(index)
	for i=1,table.len(self.tab) do
		if i == index then
			return self.tab[i]
		end
	end
	return nil
end

function List:set(index,object)
	if type(index) ~= "number" then
		return "'index' expected number, got not number"
	end
	local tmp = self.tab[index]
	for i=1,table.len(self.tab) do
		if i == index then
			self.tab[i] = object
			return tmp
		end
	end
	return "error index"
end

function List:contains(object)
	for _,value in ipairs(self.tab) do
		if value == object then
			return true
		end
	end
	return false
end

function List:isEmpty()
	return table.len(self.tab) == 0
end

function List:clear()
	for i=1,table.len(self.tab) do
		self.tab[i] = nil
	end
	self.tab = nil
end

function List:copy()
	local tmp = {}
	for key,value in ipairs(self.tab) do
		tmp[key] = value
	end
	return tmp
end

function List:display()
	for key,value in ipairs(self.tab) do
		print(key,value)
	end
end


function List:size()
	return table.len(self.tab)
end

function List:equals(object)
	if object == self.tab then
		return true
	end
	return false
end

function List:toString()
	local tmp = ""
	for key,value in pairs(self.tab) do
		if key == table.len(self.tab) then
			tmp = tmp.."'"..value.."'"
		else
			tmp = tmp.."'"..value.."',\n"
		end
	end
	return "{\n"..tmp.."\n}"
end

function List:getList()
	return self.tab
end

return List
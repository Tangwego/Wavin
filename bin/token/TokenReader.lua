-- TokenReader.lua

require "lib.base"
require "lib.util"

TokenReader = Class()

local tokens = nil
local pos = 0

function TokenReader:ctor(tokenList)
    if type(tokenList) ~= "table" then
        print("unknow type of tokens' list type:", type(tokenList))
        return
    end
    self.tokens = tokenList
end

function TokenReader:read()
    if pos < self.tokens:size() then
        pos = pos + 1
        return self.tokens:get(pos)
    end
    return nil
end

function TokenReader:peek()
    if pos < self.tokens:size() then
        return self.tokens:get(pos)
    end
    return nil
end

function TokenReader:unread()
    if pos > 0 then
        pos = pos - 1
    end
end

function TokenReader:getPosition()
    return pos
end

function TokenReader:setPosition(position)
    if position >= 0 and position <= self.tokens:size() then
        self.pos = position
    end
end
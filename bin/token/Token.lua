--Token.lua
require "lib.base"
require "token.TokenType"

Token = Class()

local text = nil
local tokenType = nil

function Token:setText(text)
    self.text = text
end

function Token:getText()
    return self.text
end

function Token:setType(tokenType)
    self.tokenType = tokenType
end

function Token:getType()
    return self.tokenType
end


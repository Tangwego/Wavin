--Lex.lua
require "lib.base"
require "lib.util"
require "lexer.token"
require "lexer.DfaState"

-- contain source code
local context = String.New()

-- tokens & token
local tokens = nil
local token = Token.New()
local tokenText = String.New()

-- save a table with line num for source file
function save(line_num,buf)
	context:append(buf)	
end

-- parse table context
function parse()
	tokens = List.New()
	local reader = parseString(context)
	printToken(reader)
end

function printToken(tokenReader)
	print("text\t\ttype\n")
	local tk = tokenReader:read()
	while tk ~= nil do
		print(tk:getText().."\t\t"..tokenType[tk:getType()])
		tk = tokenReader:read()
	end
end

function parseString(code)
	local ch = nil
	local state = DfaState.Initial
	for i = 0, code:length() do
		ch = code:get(i)
		if state == DfaState.Initial then
			state = init_token(ch)
		elseif state == DfaState.Id then
			if isAlpha(ch) or isDigit(ch) then
				tokenText:append(ch)
			else
				state = init_token(ch)
			end
		elseif state == DfaState.GT then
			if ch == '=' then
				token:setType(TokenType.GE)
				state = DfaState.GE
				tokenText:append(ch);
			else
				state = init_token(ch)
			end
		elseif state == DfaState.GE then
		    state = init_token(ch)
		elseif state == DfaState.Assignment then
		    state = init_token(ch)
		elseif state == DfaState.Plus then
		    state = init_token(ch)
		elseif state == DfaState.Minus then
		    state = init_token(ch)
		elseif state == DfaState.Mul then
		    state = init_token(ch)
		elseif state == DfaState.Div then
		    state = init_token(ch)
		elseif state == DfaState.SemiColon then
		    state = init_token(ch)
		elseif state == DfaState.LeftParen then
		    state = init_token(ch)
		elseif state == DfaState.RightParen then
		    state = init_token(ch)
		elseif state == DfaState.IntLiteral then
			if isDigit(ch) then
				tokenText:append(ch)
			else
				state = init_token(ch)
			end
		elseif state == DfaState.Id_int1 then
			if ch == 'n' then
				state = DfaState.Id_int2
				tokenText:append(ch)
			elseif isDigit(ch) or isAlpha(ch) then
				state = DfaState.Id
				tokenText:append(ch)
			else
				state = init_token(ch)
			end
		elseif state == DfaState.Id_int2 then
			if ch == 't' then
				state = DfaState.Id_int3
				tokenText:append(ch)
			elseif isDigit(ch) or isAlpha(ch) then
				state = DfaState.Id
				tokenText:append(ch)
			else
				state = init_token(ch)
			end
		elseif state == DfaState.Id_int3 then
			if isBlank(ch) then
				token:setType(TokenType.Int)
				state = init_token(ch)
			else
				state = DfaState.Id
				tokenText:append(ch)
			end
		else

		end
	end
	if tokenText:length() > 0 then
		init_token(ch)
	end
	return TokenReader.New(tokens)
end

function init_token(ch)
	if tokenText:length() > 0 then
		token:setText(tokenText:toString())
		tokens:add(0,token)
		tokenText = String.New()
		token = Token.New()
	end

	local newState = DfaState.Initial
	if isAlpha(ch) then              --第一个字符是字母
        if ch == 'i' then
            newState = DfaState.Id_int1
        else
            newState = DfaState.Id --进入Id状态
        end
        token:setType(TokenType.Identifier)
        tokenText:append(ch)
    elseif isDigit(ch) then       --第一个字符是数字
        newState = DfaState.IntLiteral
        token:setType(TokenType.IntLiteral)
        tokenText:append(ch)
    elseif ch == '>' then         --第一个字符是>
        newState = DfaState.GT
        token:setType(TokenType.GT)
        tokenText:append(ch)
    elseif ch == '+' then
        newState = DfaState.Plus
        token:setType(TokenType.Plus)
        tokenText:append(ch)
    elseif ch == '-' then
        newState = DfaState.Minus
        token:setType(TokenType.Minus)
        tokenText:append(ch)
    elseif ch == '*' then
        newState = DfaState.Mul
        token:setType(TokenType.Mul)
        tokenText:append(ch)
    elseif ch == '/' then
        newState = DfaState.Div
        token:setType(TokenType.Div)
        tokenText:append(ch)
    elseif ch == '' then
        newState = DfaState.SemiColon
        token:setType(TokenType.SemiColon)
        tokenText:append(ch)
    elseif ch == '(' then
        newState = DfaState.LeftParen
        token:setType(TokenType.LeftParen)
        tokenText:append(ch)
    elseif ch == ')' then
        newState = DfaState.RightParen
        token:setType(TokenType.RightParen)
        tokenText:append(ch)
    elseif ch == '=' then
        newState = DfaState.Assignment
        token:setType(TokenType.Assignment)
        tokenText:append(ch)
    else
        newState = DfaState.Initial -- skip all unknown patterns
    end
    return newState
end

--[[
TokenType = {
	KEY_CST = "const",
	KEY_VAR = "var",
	KEY_AND = "and",
	KEY_OR = "or",
	KEY_NOT = "not",
	KEY_EQ = "equal",
	KEY_ADD = "+",
	KEY_SUB = "-",
	KEY_MUL = "*",
	KEY_DIV = "/",
	KEY_MOD = "%",
	KEY_DO = "begin",
	KEY_END = "end",
	KEY_IF = "if",
	KEY_ELSE = "else",
	KEY_ELSEIF = "elseif",
	KEY_FUN = "func",
	KEY_LOOP = "loop",
	KEY_FALSE = "false",
	KEY_TRUE = "true",
	KEY_RETURN = "return",
	KEY_NUM = "number",
	KEY_INT = "integer",
	KEY_STR = "string",
	KEY_EOF = "eof",
	KEY_NULL = "null"
}
--]]

require "util.Utils"

tokenType = {
	"Plus",   -- +
    "Minus",  -- -
    "Mul",   -- *
    "Div",  -- /
    "GE",     -- >=
    "GT",     -- >
    "EQ",     -- ==
    "LE",     -- <=
    "LT",     -- <
    "SemiColon", -- ;
    "LeftParen", -- (
    "RightParen",-- )
    "Assignment",-- =
    "If",
    "Else",
    "Int",
    "Identifier",     --标识符
    "IntLiteral",     --整型字面量
    "StringLiteral"   --字符串字面量
}

TokenType = CreatEnumTable(tokenType)
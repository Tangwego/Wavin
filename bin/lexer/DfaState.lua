--DfaState.lua

require "util.Utils"

local dfaState = {
    "Initial",
    "If", 
    "Id_if1", 
    "Id_if2", 
    "Else", 
    "Id_else1", 
    "Id_else2", 
    "Id_else3", 
    "Id_else4", 
    "Int", 
    "Id_int1", 
    "Id_int2", 
    "Id_int3", 
    "Id", 
    "GT", 
    "GE",
    "Assignment",
    "Plus", "Minus", "Mul", "Div",
    "SemiColon",
    "LeftParen",
    "RightParen",
    "IntLiteral"
}

DfaState = CreatEnumTable(dfaState)
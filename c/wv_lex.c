#include "wavin.h"

void save_to_lua(char *buf,int line_num)
{
	lua_getglobal(L,"save");
	lua_pushinteger(L, line_num);
	lua_pushstring(L,buf);
	int ret = lua_pcall(L, 2, 0, 0);
	if (ret != 0)
	{
		log_assert("run lua function error!\n line: %d near %s\n",line_num,buf);
	}
}

void lexer_parse()
{
	lua_getglobal(L, "parse");
	int ret = lua_pcall(L, 0, 0, 0);
	if (ret != 0)
	{
		log_assert("lexical analysis failure..!");
	}
}



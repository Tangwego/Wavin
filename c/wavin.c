#include <stdio.h>
#include <string.h>
#include "wavin.h"

void print_usage()
{
	printf("Wavin Compiler [1.0.0](C) Usage [-v][filename]\n");
	printf("Wavin version 1.0.0  Copyright (C) 2017-2018 by Wavin Don.\n");
}

void export_libs()
{
	lua_register(L, "printf", lua_printf);
	lua_register(L, "logi", lua_log_info);
	lua_register(L, "assert", lua_log_assert);
}

int main(int argc, char* argv[])
{
	char* filename = argv[1];
	FILE* file;
	int line_num = 0;
	char buf[1000];
	const char* luapath = "./parser/Lex.lua";
	if (argv[1] == NULL)
	{
		print_usage();
		return 0;
	}
	if (strcmp(argv[1], "-v") == 0)
	{
		printf("Wavin version 1.0.0  Copyright (C) 2017-2018 by Wavin Don.\n");
		return 0;
	}

	if (strcmp(argv[1], "-h") == 0)
	{
		print_usage();
		return 0;
	}
	file = fopen(filename, "r");
	if (!file)
	{
		printf("%s: cannot open input file %s\n", argv[0], filename);
		return -1;
	}
	L = luaL_newstate();
	if (L == NULL)
	{

		return -1;
	}
	luaL_openlibs(L);
	if (luaL_dofile(L, luapath))
	{
		printf("cannot open lua file: %s\n", luapath);
		return -1;
	}

	export_libs();

	while (fgets(buf, 1000, file)) {
		line_num++;
		if (buf[strlen(buf) - 1] == '\n')
			buf[strlen(buf) - 1] = 0;
		save_to_lua(buf, line_num);
	}
	lexer_parse();
	fclose(file);
	lua_close(L);
	return 0;
}


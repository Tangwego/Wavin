#include <stdio.h>
#include <time.h>
#include "wavin.h"
#include <stdarg.h>

void log_info(const char* format, ...)
{
	time_t now;
	struct tm* tm_now;
	va_list valist;
	time(&now);
	tm_now = localtime(&now);
	int year = tm_now->tm_year + 1900;
	int month = tm_now->tm_mon + 1;
	int date = tm_now->tm_mday;
	int hour = tm_now->tm_hour;
	int min = tm_now->tm_min;
	int sec = tm_now->tm_sec;
	printf("[%02d-%02d-%02d %02d:%02d:%02d]\t", year, month, date, hour, min, sec);
	va_start(valist, format);
	vprintf(format, valist);
	va_end(valist);
}

void log_assert(const char* format, ...)
{
	time_t now;
	struct tm* tm_now;
	va_list valist;
	time(&now);
	tm_now = localtime(&now);
	int year = tm_now->tm_year + 1900;
	int month = tm_now->tm_mon + 1;
	int date = tm_now->tm_mday;
	int hour = tm_now->tm_hour;
	int min = tm_now->tm_min;
	int sec = tm_now->tm_sec;
	printf("[%02d-%02d-%02d %02d:%02d:%02d]\t", year, month, date, hour, min, sec);
	va_start(valist, format);
	vprintf(format, valist);
	va_end(valist);
	exit(WV_ASSERT);
}

WV_API void lua_log_info(lua_State* l)
{
	time_t now;
	struct tm* tm_now;
	time(&now);
	tm_now = localtime(&now);
	int year = tm_now->tm_year + 1900;
	int month = tm_now->tm_mon + 1;
	int date = tm_now->tm_mday;
	int hour = tm_now->tm_hour;
	int min = tm_now->tm_min;
	int sec = tm_now->tm_sec;
	char* msg = luaL_checkstring(l, 1);
	printf("[%02d-%02d-%02d %02d:%02d:%02d]\t", year, month, date, hour, min, sec);
	lua_pushstring(l, msg);
	lua_printf(l);
}

WV_API void lua_log_assert(lua_State* l)
{
	time_t now;
	struct tm* tm_now;
	time(&now);
	tm_now = localtime(&now);
	int year = tm_now->tm_year + 1900;
	int month = tm_now->tm_mon + 1;
	int date = tm_now->tm_mday;
	int hour = tm_now->tm_hour;
	int min = tm_now->tm_min;
	int sec = tm_now->tm_sec;
	char* msg = luaL_checkstring(l, 1);
	printf("[%02d-%02d-%02d %02d:%02d:%02d]\t", year, month, date, hour, min, sec);
	lua_pushstring(l, msg);
	lua_printf(l);
	exit(WV_ASSERT);
}

WV_API void lua_printf(lua_State* l)
{
	int argc = lua_gettop(l);
	int index = 1;
	char* format = luaL_checkstring(l, index);
	index++;
	void* tmp;
	while (*format != '\0') {
		// deal with format print using '%'
		if (*format == '%') {
			format++;
			if (*format == 'd') {
				tmp = luaL_checkinteger(l, index);
				printf("%d", (int)tmp);
				index++;
			}else if (*format == 'f') {
				printf("%f", luaL_checknumber(l, index));
				index++;
			}else if (*format == 'c') {
				if (lua_isinteger(l, index)) {
					tmp = luaL_checkinteger(l, index);
					printf("%c", (char)tmp);
				}else {
					tmp = luaL_checkstring(l, index);
					printf("%c", ((char*)tmp)[0]);
				}
				index++;
			}else if (*format == 's') {
				tmp = luaL_checkstring(l, index);
				printf("%s", (char *)tmp);
				index++;
			}else {
				printf("%%%c", *format);
			}
		}else if (*format == '\n') {
			printf("\n");
		}else {
			printf("%c", *format);
		}
		format++;
	}
}

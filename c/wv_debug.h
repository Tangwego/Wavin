#pragma once
#ifndef __TDEBUG_H__
#define __TDEBUG_H__

void log_info(const char* format, ...);
void log_assert(const char* format, ...);
WV_API void lua_log_info(lua_State* l);
WV_API void lua_log_assert(lua_State* l);
WV_API void lua_printf(lua_State* l);

#endif // !__TDEBUG_H__

#pragma once
#ifndef __WVTYPES_H__
#define __WVTYPES_H__

#define WV_API extern 

enum {
	WV_SUCCESS=0,
	WV_FALSE,
	WV_MEMERR,
	WV_INFO,
	WV_NOTICE,
	WV_WARNING,
	WV_ERROR,
	WV_ASSERT
}wv_code_t;

#endif
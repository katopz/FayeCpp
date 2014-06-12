/*
 *   Copyright 2012 - 2014 Kulykov Oleh
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */
 
/*--------------------------------------------------------------------------
 * This file is autogenerated from fayecpp_config.h.in 
 * during the cmake configuration of your project. If you need to make changes
 * edit the original file NOT THIS FILE.
 * For enabling something define variable as 1, for disabling comment
 * --------------------------------------------------------------------------*/
 
#ifndef __FAYECPP_CONFIG_H__ 
#define __FAYECPP_CONFIG_H__ 



/* libwebsockets.h */
#define HAVE_LIBWEBSOCKETS_H 1 


/* jansson.h */
#define HAVE_JANSSON_H 1 


/* stdlib.h */
#define HAVE_STDLIB_H 1 


/* inttypes.h */
#define HAVE_INTTYPES_H 1


/* sys/types.h */
#define HAVE_SYS_TYPES_H 1


/* stddef.h */
#define HAVE_STDDEF_H 1


/* stdbool.h */
#define HAVE_STDBOOL_H 1


/* stdint.h */
#define HAVE_STDINT_H 1


/* stdarg.h */
#define HAVE_STDARG_H 1


/* limits.h */
#define HAVE_LIMITS_H 1


/* float.h */
#define HAVE_FLOAT_H 1


/* mach/mach_time.h */
#define HAVE_MACH_MACH_TIME_H 1


/* sys/time.h */
#define HAVE_SYS_TIME_H 1


/* time.h */
#define HAVE_TIME_H 1


/* sys/time.h */
#define HAVE_SYS_TIME_H 1


/* locale.h */
#define HAVE_LOCALE_H 1


/* sys/stat.h */
#define HAVE_SYS_STAT_H 1


/* fcntl.h */
#define HAVE_FCNTL_H 1


/* pthread.h */
#define HAVE_PTHREAD_H 1


/* sys/resource.h */
#define HAVE_SYS_RESOURCE_H 1


/* direct.h */
/* #undef HAVE_DIRECT_H */


/* wchar.h */
#define HAVE_WCHAR_H 1


/* memory.h */
#define HAVE_MEMORY_H 1


/* string.h */
#define HAVE_STRING_H 1


/* math.h */
#define HAVE_MATH_H 1


/* malloc.h */ 
/* #undef HAVE_MALLOC_H */


/* errno.h */
#define HAVE_ERRNO_H 1


/* sys/errno.h */
#define HAVE_SYS_ERRNO_H 1


/* io.h */
/* #undef HAVE_IO_H */


/* signal.h */
#define HAVE_SIGNAL_H 1


/* setjmp.h */
#define HAVE_SETJMP_H 1


/* unistd.h */
#define HAVE_UNISTD_H 1


/* dispatch/dispatch.h */
//#define HAVE_DISPATCH_DISPATCH_H 1


/* includes */
#if defined(HAVE_SYS_TYPES_H)
#include <sys/types.h>
#endif

#if defined(HAVE_MALLOC_H)
#include <malloc.h>
#endif


/* sizes */
/* int8_t */
#define SIZEOF_INT8_T 1

/* uint8_t */
#define SIZEOF_UINT8_T 1

/* int16_t */
#define SIZEOF_INT16_T 2

/* uint16_t */
#define SIZEOF_UINT16_T 2

/* int32_t */
#define SIZEOF_INT32_T 4

/* uint32_t */
#define SIZEOF_UINT32_T 4

/* int64_t */
#define SIZEOF_INT64_T 8

/* uint64_t */
#define SIZEOF_UINT64_T 8

/* uintptr_t */
#define SIZEOF_UINTPTR_T 8

/* char */
#define SIZEOF_CHAR 1

/* long int */
#define SIZEOF_LONG_INT 8

/* long long int */
#define SIZEOF_LONG_LONG_INT 8

/* float */
#define SIZEOF_FLOAT 4

/* double */
#define SIZEOF_DOUBLE 8 

/* long double */
#define SIZEOF_LONG_DOUBLE 16 

/* bool */
#define SIZEOF_BOOL 1 

/* float128 */
#define FLOAT128_TYPE long double 

/* int128, uint128 */
#define INT128_TYPE __int128_t
#define UINT128_TYPE __uint128_t



/* structures */
/* struct stat */
#define HAVE_STRUCT_STAT 1 


/* struct _stat */
/* #undef HAVE_STRUCT__STAT */



/* functions */
/* posix_memalign */
#define HAVE_FUNCTION_POSIX_MEMALIGN 1 


/* usleep */
#define HAVE_FUNCTION_USLEEP 1 


/* getrlimit */
//#define HAVE_FUNCTION_GETRLIMIT 1 


/* pthread_attr_setscope */
#define HAVE_FUNCTION_PTHREAD_ATTR_SETSCOPE 1 


/* pthread_attr_setstacksize */
#define HAVE_FUNCTION_PTHREAD_ATTR_SETSTACKSIZE 1 


/* pthread_cancel */
//#define HAVE_FUNCTION_PTHREAD_CANCEL 1


/* _stat */
/* #undef HAVE_FUNCTION__STAT */


/* stat */
#define HAVE_FUNCTION_STAT 1 


/* _wstat */
/* #undef HAVE_FUNCTION__WSTAT */


/* access */
#define HAVE_FUNCTION_ACCESS  1 


/* _access */
/* #undef HAVE_FUNCTION__ACCESS */


/* _waccess */
/* #undef HAVE_FUNCTION__WACCESS */


/* _mkdir */
/* #undef HAVE_FUNCTION__MKDIR */


/* mkdir */
#define HAVE_FUNCTION_MKDIR 1 


/* _wmkdir */
/* #undef HAVE_FUNCTION__WMKDIR */


/* clock_gettime */
/* #undef HAVE_FUNCTION_CLOCK_GETTIME */


/* fabsf */
#define HAVE_FUNCTION_FABSF 1 


/* fabs */
#define HAVE_FUNCTION_FABS 1 


/* floorf */
#define HAVE_FUNCTION_FLOORF 1 


/* floor */
#define HAVE_FUNCTION_FLOOR 1 


/* powf */
#define HAVE_FUNCTION_POWF 1 


/* pow */
#define HAVE_FUNCTION_POW 1 


/* cosf */
#define HAVE_FUNCTION_COSF 1 


/* cos */
#define HAVE_FUNCTION_COS 1 


/* sinf */
#define HAVE_FUNCTION_SINF 1 


/* sin */
#define HAVE_FUNCTION_SIN 1 


/* sqrtf */
#define HAVE_FUNCTION_SQRTF 1 


/* sqrt */
#define HAVE_FUNCTION_SQRT 1 


/* _wfopen */
/* #undef HAVE_FUNCTION__WFOPEN */


/* _wfopen_s */
/* #undef HAVE_FUNCTION__WFOPEN_S */


/* fopen_s */
/* #undef HAVE_FUNCTION_FOPEN_S */


/* sscanf_s */
/* #undef HAVE_FUNCTION_SSCANF_S */


/* sprintf_s */
/* #undef HAVE_FUNCTION_SPRINTF_S */


/* vsprintf_s */
/* #undef HAVE_FUNCTION_VSPRINTF_S */


/* dispatch_sync */
//#define HAVE_FUNCTION_DISPATCH_SYNC 1


/* dispatch_async */
//#define HAVE_FUNCTION_DISPATCH_ASYNC 1


/* dispatch_get_global_queue */
//#define HAVE_FUNCTION_DISPATCH_GET_GLOBAL_QUEUE 1


/* dispatch_after */
//#define HAVE_FUNCTION_DISPATCH_AFTER 1


#endif /* __FAYECPP_CONFIG_H__ */



/* support Lua 5.3+ */
#if LUA_VERSION_NUM > 502
#define LUA_QL(x)	"'" x "'"
#define LUA_QS		LUA_QL("%s")
#endif

#if HPDF_VERSION_ID <= 20404
/* avoid these Haru functions when libpng is not available */
/* avoid 'unused variable' warnings */
#ifndef LIBHPDF_HAVE_LIBPNG
#define EMPTY 0; (void) pdf; (void) filename
#define HPDF_LoadPngImageFromFile(pdf,filename) EMPTY
#define HPDF_LoadPngImageFromFile2(pdf,filename) EMPTY
#endif
#endif

/* new in libHaru 2.4.5 */
#ifndef HPDF_FAILD_TO_ALLOC_MEM
#define HPDF_FAILD_TO_ALLOC_MEM HPDF_FAILED_TO_ALLOC_MEM
#endif

#if LUA_VERSION_NUM > 502
#define LUA_QL(x)	"'" x "'"
#define LUA_QS		LUA_QL("%s")
#endif

#ifndef LIBHPDF_HAVE_LIBPNG
#define EMPTY 0; (void) pdf; (void) filename
#define HPDF_LoadPngImageFromFile(pdf,filename) EMPTY
#define HPDF_LoadPngImageFromFile2(pdf,filename) EMPTY
#endif

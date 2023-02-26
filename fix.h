#if LUA_VERSION_NUM > 502
#define LUA_QL(x)	"'" x "'"
#define LUA_QS		LUA_QL("%s")
#endif

#ifndef LIBHPDF_HAVE_LIBPNG
#define HPDF_LoadPngImageFromFile(pdf,filename) (0)
#define HPDF_LoadPngImageFromFile2(pdf,filename) (0)
#endif

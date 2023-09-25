This repository fixes [LuaHPDF](https://github.com/jung-kurt/luahpdf) to use Lua 5.3+ and [libHaru](http://libharu.org) to work with LuaHPDF when libpng is not available (as is the default in macOS).
The fix is concentrated in fix.h, which is included in a patched hpdf.c.
See also issue [266](https://github.com/libharu/libharu/issues/266) in libHaru.

To build do

    make -C src get
    make

See also these generic [instructions](https://web.tecgraf.puc-rio.br/~lhf/ftp/lua/install.html) for [my Lua libraries](https://web.tecgraf.puc-rio.br/~lhf/ftp/lua).

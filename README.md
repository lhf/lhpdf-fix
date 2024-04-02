This repository fixes [LuaHPDF](https://github.com/jung-kurt/luahpdf) to use Lua 5.3+ and [libHaru](http://libharu.org) to work with LuaHPDF when libpng is not available (the default in macOS). See also issue [266](https://github.com/libharu/libharu/issues/266) in libHaru.

The fix is tiny and is concentrated in fix.h, which is included in a slightly patched hpdf.c (see the DIFFS).

To build do

    make -C src get
    make

This will also run test.lua and output test.pdf. Try also the [LuaHPDF demos](https://github.com/jung-kurt/luahpdf/tree/master/demo).

See also these generic [instructions](https://web.tecgraf.puc-rio.br/~lhf/ftp/lua/install.html) for [my Lua libraries](https://web.tecgraf.puc-rio.br/~lhf/ftp/lua).

The code in hpdf.c is subject to the [LuaHPDF License](https://github.com/jung-kurt/luahpdf/blob/master/doc/license.md).

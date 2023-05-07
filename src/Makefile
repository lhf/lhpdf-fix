# Makefile for building libHaru library
# libHaru is available at http://libharu.org
# The code here is from https://github.com/libharu/libharu/tarball/master

U= https://github.com/libharu/libharu/tarball/master
D= https://raw.githubusercontent.com/libharu/libharu/devel/src/

CC= gcc -std=c99
CFLAGS= -pedantic -Wall -Wextra -O2 $(PIC)
MYCFLAGS= $(CFLAGS)
L= libhpdf.a

all:	$L

$L:	*.c *.h
	$(CC) $(MYCFLAGS) -c *.c
	ar rcu $L *.o
	-rm -f *.o

get:
	wget $U || curl -L -R -O $U
	tar zxf master
	mv libharu-libharu-*/src/*.[ch] .
	mv libharu-libharu-*/include/*.h .
	-rm -fr libharu-libharu-* master
	cp -p ../hpdf_config.h .

patch:
	wget $D/hpdf_fontdef_jp.c
	wget $D/hpdf_fontdef_kr.c

clean:
	-rm -f *.o *.a $T

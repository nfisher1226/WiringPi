#
# Makefile:
#	wiringPi device - A "wiring" library for the Raspberry Pi
#
#	Copyright (c) 2012-2016 Gordon Henderson
#################################################################################
# This file is part of wiringPi:
#	https://projects.drogon.net/raspberry-pi/wiringpi/
#
#    wiringPi is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Lesser General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    wiringPi is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Lesser General Public License for more details.
#
#    You should have received a copy of the GNU Lesser General Public License
#    along with wiringPi.  If not, see <http://www.gnu.org/licenses/>.
#################################################################################

STATIC = libwiringPiDev.a
DYNAMIC = libwiringPiDev.so.$(VERSION)

#DEBUG	= -g -O0
DEBUG	= -O2
CC		= gcc
INCLUDE	= -I. -I${BASEDIR}/wiringPi
LDFLAGS	= -L${BASEDIR}/wiringPi -L${BASEDIR}/devLib
DEFS	= -D_GNU_SOURCE
CFLAGS	= ${DEBUG} ${DEFS} -Wformat=2 -Wall -Winline ${INCLUDE} \
	${LDFLAGS} -pipe -fPIC

LIBS    =

###############################################################################

SRC	=	ds1302.c maxdetect.c  piNes.c		\
		gertboard.c piFace.c			\
		lcd128x64.c lcd.c			\
		scrollPhat.c				\
		piGlow.c

OBJ	=	$(SRC:.c=.o)

HEADERS	=	ds1302.h \
			gertboard.h \
			lcd128x64.h \
			lcd.h \
			maxdetect.h \
			piFace.h \
			piGlow.h \
			piNes.h \
			scrollPhat.h

all: $(DYNAMIC)

static: $(STATIC)

$(STATIC): $(OBJ)
	ar rcs $(STATIC) $(OBJ)
	ranlib $(STATIC)
#	@size   $(STATIC)

$(DYNAMIC): $(OBJ)
	$(CC) -shared -Wl,-soname,libwiringPiDev.so$(WIRINGPI_SONAME_SUFFIX) \
		-o libwiringPiDev.so.$(VERSION) -lpthread $(OBJ)
	ln -sf libwiringPiDev.so.${VERSION} libwiringPiDev.so

.c.o:
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	for obj in $(OBJ) *~ core tags libwiringPiDev.* ; \
		do [ -f $${obj} ] && unlink $${obj} || true ; done

tags: $(SRC)
	ctags $(SRC)

install: $(DYNAMIC)
	install -m 0755 -d $(DESTDIR)$(PREFIX)/include
	install -m 0644 $(HEADERS) $(DESTDIR)$(PREFIX)/include
	install -m 0755 -d $(DESTDIR)$(PREFIX)/lib
	install -m 0644 libwiringPiDev.so.$(VERSION) \
		$(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so.$(VERSION)
	ln -sf libwiringPiDev.so.$(VERSION)	\
		$(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so
	$(LDCONFIG)

install-static:	$(STATIC)
	install -m 0755 -d $(DESTDIR)$(PREFIX)/include
	install -m 0644 $(HEADERS) $(DESTDIR)$(PREFIX)/include
	install -m 0755 -d $(DESTDIR)$(PREFIX)/lib
	install -m 0644 libwiringPiDev.a $(DESTDIR)$(PREFIX)/lib

uninstall:
	for hdr in $(HEADERS) ; \
		do [ -f ${DESTDIR}${PREFIX}/$${hdr} ] && \
		unlink ${DESTDIR}${PREFIX}/$${hdr} || true ; done
	[ -f ${DESTDIR}${PREFIX}/lib/libwiringPiDev.so.$(VERSION) ] && \
		unlink ${DESTDIR}${PREFIX}/lib/libwiringPiDev.so.$(VERSION) || true
	[ -f ${DESTDIR}${PREFIX}/lib/libwiringPiDev.so ] && \
		unlink ${DESTDIR}${PREFIX}/lib/libwiringPiDev.so || true
	$(LDCONFIG)

depend:
	makedepend -Y $(SRC)

.PHONY:	depend	install-static install clean tags uninstall

# DO NOT DELETE

ds1302.o: ds1302.h
maxdetect.o: maxdetect.h
piNes.o: piNes.h
gertboard.o: gertboard.h
piFace.o: piFace.h
lcd128x64.o: font.h lcd128x64.h
lcd.o: lcd.h
scrollPhat.o: scrollPhatFont.h scrollPhat.h
piGlow.o: piGlow.h

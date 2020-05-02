#
# Makefile:
#	The gpio command:
#	  A swiss-army knige of GPIO shenanigans.
#	https://projects.drogon.net/wiring-pi
#
#	Copyright (c) 2012-2016 Gordon Henderson
#################################################################################
# This file is part of wiringPi:
#	A "wiring" library for the Raspberry Pi
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

#DEBUG	= -g -O0
DEBUG	= -O2
CC		= gcc
INCLUDE	= -I. -I${BASEDIR}/wiringPi -I${BASEDIR}/devLib
CFLAGS	= ${DEBUG} -Wall -Wextra $(INCLUDE) -Winline -pipe

LDFLAGS	= -L${BASEDIR}/wiringPi -L${BASEDIR}/devLib
LIBS    = -lwiringPi -lwiringPiDev -lpthread -lrt -lm -lcrypt

# May not need to  alter anything below this line
###############################################################################

SRC	=	gpio.c readall.c

OBJ	=	$(SRC:.c=.o)

all: gpio

version.h: ../VERSION
	$Q echo Need to run newVersion above.

gpio: $(OBJ)
	$(CC) -o $@ $(OBJ) $(LDFLAGS) $(LIBS)

.c.o:
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJ) gpio *~ core tags *.bak

tags:	$(SRC)
	ctags $(SRC)

install: gpio
	install -d -m 0755 $(DESTDIR)$(PREFIX)/bin
	install -m 0755 gpio $(DESTDIR)$(PREFIX)/bin/
ifneq ($(WIRINGPI_SUID),0)
	chown root.root	$(DESTDIR)$(PREFIX)/bin/gpio
	chmod 4755		$(DESTDIR)$(PREFIX)/bin/gpio
endif
	install -m 0755 -d $(DESTDIR)$(PREFIX)/share/man/man1
	install -m 0644 gpio.1 $(DESTDIR)$(PREFIX)/share/man/man1/

uninstall:
	[ -f ${DESTDIR}${PREFIX}/bin/gpio ] && \
		unlink $(DESTDIR)$(PREFIX)/bin/gpio || true
	[ -f $(DESTDIR)$(PREFIX)/share/man/man1/gpio.1 ] && \
		unlink $(DESTDIR)$(PREFIX)/share/man/man1/gpio.1 || true

depend:
	makedepend -Y $(SRC)

.PHONY: clean tags install uninstall depend

# DO NOT DELETE

gpio.o: ../version.h

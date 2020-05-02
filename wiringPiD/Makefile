#
# Makefile:
#	The wiringPiD utility:
#	https://projects.drogon.net/wiring-pi
#
#	Copyright (c) 2012-2017 Gordon Henderson
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
CC	= gcc
INCLUDE	= -I. -I${BASEDIR}/wiringPi -I${BASEDIR}/devLib
CFLAGS	= $(DEBUG) -Wall -Wextra ${INCLUDE} -Winline -pipe

LDFLAGS	= -L${BASEDIR}/wiringPi -L${BASEDIR}/devLib
LIBS    = -lwiringPi -lwiringPiDev -lpthread -lrt -lm -lcrypt

# May not need to  alter anything below this line
###############################################################################

SRC	=	wiringpid.c network.c runRemote.c daemonise.c

OBJ	=	$(SRC:.c=.o)

all:		wiringpid

wiringpid:	$(OBJ)
	$(CC) -o $@ $(OBJ) $(LDFLAGS) $(LIBS)

.c.o:
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJ) wiringpid *~ core tags *.bak

tags:	$(SRC)
	ctags $(SRC)

install: wiringpid
	install -m 0755 -d				$(DESTDIR)$(PREFIX)/sbin
	install -m 0755 wiringpid		$(DESTDIR)$(PREFIX)/sbin/

uninstall:
	[ -f ${DESTDIR}${PREFIX}/sbin/wiringpid ] && \
		unlink $(DESTDIR)$(PREFIX)/sbin/wiringpid || true

depend:
	makedepend -Y $(SRC)

.PHONY: clean tags install uninstall depend
# DO NOT DELETE

wiringpid.o: drcNetCmd.h network.h runRemote.h daemonise.h
network.o: network.h
runRemote.o: drcNetCmd.h network.h runRemote.h
daemonise.o: daemonise.h

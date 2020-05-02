#
# Makefile:
#	wiringPi - Wiring Compatable library for the Raspberry Pi
#
#	Copyright (c) 2012-2015 Gordon Henderson
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

export PREFIX?=/usr/local
export VERSION = $(shell cat VERSION)
export BASEDIR = $(shell pwd)
LDCONFIG?=ldconfig

subdirs =	wiringPi	\
			devLib		\
			gpio		\
			wiringPiD

all: ${subdirs}

wiringPi:
	$(MAKE) -C wiringPi

devLib: wiringPi
	$(MAKE) -C devLib

gpio: devLib
	$(MAKE) -C gpio

wiringPiD: devLib
	$(MAKE) -C wiringPiD

install:
	for subdir in ${subdirs} ; \
		do $(MAKE) -C $${subdir} install ; done

uninstall:
	for subdir in ${subdirs} ; \
		do $(MAKE) -C $${subdir} uninstall ; done

clean:
	for subdir in ${subdirs} ; \
		do $(MAKE) -C $${subdir} clean ; done

.PHONY: install uninstall clean ${subdirs}

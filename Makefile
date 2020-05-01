# Stub

PREFIX?=/usr/local
VERSION = $(shell cat VERSION)
LDCONFIG?=ldconfig

subdirs =	WiringPi	\
			devLib		\
			gpio		\
			wiringPid

all:
	for subdir in ${subdirs} ; \
		do $(MAKE) -C $${subdir} ; done

install:
	for subdir in ${subdirs} ; \
		do $(MAKE) -C $${sudir} install ; done

uninstall:
	for subdir in ${subdirs} ; \
		do $(MAKE) -C $${sudir} uninstall ; done

clean:
	for subdir in ${subdirs} ; \
		do $(MAKE) -C $${sudir} clean ; done

.PHONY: install uninstall clean

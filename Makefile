INSTALLBIN=$(DESTDIR)/usr/bin
INSTALLDESKTOP=$(DESTDIR)/usr/share/applications/
INSTALLLOCALE=$(DESTDIR)/usr/share/locale

INSTALL=install -c
INSTALL_PROGRAM = ${INSTALL}

MAINNAME=knxm-mkusbmath-debian

ALLLANG=$(basename $(notdir $(wildcard po/*.mo)))

all: *
	cd po; make all; cd -

install: all
	$(INSTALL_PROGRAM) -d  $(INSTALLBIN)
	$(INSTALL_PROGRAM) -m 755 bin/$(MAINNAME) $(INSTALLBIN)
	$(INSTALL_PROGRAM) -d  $(INSTALLDESKTOP)
	$(INSTALL_PROGRAM) -m 644 desktop/$(MAINNAME).desktop $(INSTALLDESKTOP)
	$(INSTALL_PROGRAM) -d  $(INSTALLLOCALE)
	for LANGCODE in $(ALLLANG); do $(INSTALL_PROGRAM) -m 644 -D po/$${LANGCODE}.mo $(INSTALLLOCALE)/$${LANGCODE}/LC_MESSAGES/$(MAINNAME).mo; done

clean: 
	echo "do nothing.."

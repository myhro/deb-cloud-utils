NAME = cloud-utils
libdir = /usr/share/$(NAME)
LIBDIR = $(DESTDIR)$(libdir)
BINDIR = $(DESTDIR)/usr/bin
MANDIR = $(DESTDIR)/usr/share/man/man1
DOCDIR = $(DESTDIR)/usr/share/doc/$(NAME)

binprogs := $(subst bin/,,$(wildcard bin/*))
manpages := $(subst man/,,$(wildcard man/*.1))

build:
	echo manpages=$(manpages)

install:
	mkdir -p "$(BINDIR)" "$(DOCDIR)" "$(MANDIR)"
	cd bin && install $(binprogs) "$(BINDIR)"
	cd man && install $(manpages) "$(MANDIR)/" --mode=0644

clean:
	:

uninstall:
	cd "$(BINDIR)" && rm -f $(binprogs) || :
	cd "$(MANDIR)" && rm -f $(manpages) || :

.POSIX:

PREFIX = /usr/local

all:
	gcc -O3 -march=native -mavx2 dwmblocks.c -lX11 -o dwmblocks
	strip --strip-all dwmblocks
debug:
	gcc -O0 -ggdb3 dwmblocks.c -lX11 -o dwmblocks
clean:
	rm -f *.o *.gch dwmblocks
install: output
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f dwmblocks $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dwmblocks
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dwmblocks

.PHONY: clean install uninstall

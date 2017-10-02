.SUFFIXES: .xml .html .dot .svg .gnuplut .png .c.xml

PREFIX		?= /var/vhosts/sisu.io/htdocs

PAGES		= index.html \
		  hello.html

CSSS		= index.css

GENS		=

GENHTMLS	=

IMAGES		=

BUILT		=

www: $(PAGES)

.xml.html:
	cp -f $< $@

#hello.html: hello.xml
#	sblg -t hello.xml -o $@

installwww: www
	mkdir -p $(PREFIX)/{img}
	install -m 0444 $(IMAGES) $(GENHTMLS) $(BUILT) $(CSSS) $(PAGES) \
		$(PREFIX)
	install -m 0444 img/*.png $(PREFIX)/img

clean:
	rm -f $(PAGES) $(GENS)


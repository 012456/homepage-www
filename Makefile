all: docs/index.html docs/404.html

docs/index.html: index.md tmpl.html
	sed 12q tmpl.html > $@
	markdown $< >> $@
	tail -n 3 tmpl.html >> $@

docs/404.html: 404.md tmpl.html
	sed 12q tmpl.html | sed 's/slime/404/' > $@
	markdown $< >> $@
	tail -n 3 tmpl.html >> $@

clean:
	rm docs/*.html

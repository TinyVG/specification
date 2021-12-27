

IMAGES=\
	graphics/coordinates.pdf \
	graphics/gradients.pdf \
	graphics/outline-polgon.pdf \
	graphics/outline-rectangles.pdf \
	graphics/overview.pdf \
	graphics/fill-polygon.pdf \
	graphics/fill-rectangles.pdf \
	graphics/draw-line-loop.pdf \
	graphics/draw-line-strip.pdf \
	graphics/draw-lines.pdf \
	design/logo.pdf

all: specification.pdf specification.md specification.txt

specification.pdf: specification.tex clean $(IMAGES)
	rm -f *.aux *.log *.pdf *.fls *.synctex.gz *.fdb_latexmk
	xelatex -interaction=nonstopmode -halt-on-error "$<"
	xelatex -interaction=nonstopmode -halt-on-error "$<"

specification.md: specification.tex
	pandoc -f latex -t gfm -o "$@" "$<"

specification.txt: specification.tex
	pandoc -f latex -t plain -o "$@" "$<"

%.pdf: %.svg
	rsvg-convert "$<" -f pdf -o "$@"

%.svg: %.tvgt
	tvg-text -o "$@" "$<"

clean: 
	rm -f *.aux *.log *.pdf *.fls *.synctex.gz *.fdb_latexmk

.SUFFIXES: 
.PHONY: clean

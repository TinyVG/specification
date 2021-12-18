

IMAGES=\
	graphics/coordinates.pdf \
	graphics/gradients.pdf \
	graphics/outline-polgon.pdf \
	graphics/outline-rectangles.pdf \
	graphics/overview.pdf

all: specification.pdf specification.md specification.txt

specification.pdf: specification.tex $(IMAGES)
	xelatex "$<"
	xelatex "$<"

specification.md: specification.tex
	pandoc -f latex -t gfm -o "$@" "$<"


specification.txt: specification.tex
	pandoc -f latex -t plain -o "$@" "$<"

%.pdf: %.svg
	rsvg-convert "$<" -f pdf -o "$@"
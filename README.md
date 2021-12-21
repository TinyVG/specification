# TinyVG Specification

TinyVG is a new vector graphics format that tries to be both simpler and smaller than SVG.

The core features are:

- Compact binary representation (39% file size compared to SVG)
- Cover 90% of typically used SVG features files while only having a tiny fraction of complexity
- Common 2D primitives are supported (paths, lines, rectangles, polygons)
- Linear and radial two-point gradient support.
- Configurable precision for smaller files.
- Comprehensible specification

## Contribution

- If you find a defect / bad formulation in the specification, open an issue.
- If you propose changes to the format, please open an issue.
- If you want to improve the document without semantic changes, feel free to directly create a PR which improves the document.

## Building

The specification is shipped as PDF, TXT and CommonMark documents. To build these, you have to install `xetex` + `texlive` packages, `pandoc` and `rsvg`. After these are installed, you can then build the final files by invoking main:

```sh-session
[user@host specification]$ make
rm -f *.aux *.log *.pdf *.fls *.synctex.gz *.fdb_latexmk
rsvg-convert "graphics/coordinates.svg" -f pdf -o "graphics/coordinates.pdf"
rsvg-convert "graphics/gradients.svg" -f pdf -o "graphics/gradients.pdf"
rsvg-convert "graphics/outline-polgon.svg" -f pdf -o "graphics/outline-polgon.pdf"
rsvg-convert "graphics/outline-rectangles.svg" -f pdf -o "graphics/outline-rectangles.pdf"
rsvg-convert "graphics/overview.svg" -f pdf -o "graphics/overview.pdf"
rm -f *.aux *.log *.pdf *.fls *.synctex.gz *.fdb_latexmk
xelatex -interaction=batchmode -halt-on-error "specification.tex"
This is XeTeX, Version 3.141592653-2.6-0.999993 (TeX Live 2021/VoidLinux) (preloaded format=xelatex)
 restricted \write18 enabled.
entering extended mode
xelatex -interaction=batchmode -halt-on-error "specification.tex"
This is XeTeX, Version 3.141592653-2.6-0.999993 (TeX Live 2021/VoidLinux) (preloaded format=xelatex)
 restricted \write18 enabled.
entering extended mode
[user@host specification]$
```

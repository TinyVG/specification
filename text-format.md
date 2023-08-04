# TVG Text Format

This document is an auxiliary document side-by-side to the TVG specification to allow a non-binary representation of TVG files.

This format is meant for debugging/development and is not required to be implemented by conforming implementations.

## Structure

```lisp
(tvg 1
  (<width> <height> <scale> <format> <precision>)
  (
    (r g b)
    (r g b)
    (r g b a)
    ...
  )
  (
    (
      fill_rectangles
      <style>
      (
        (<x> <y> <width> <height>)
        ...
      )
    )
    (
      outline_fill_rectangles
      <fill_style>
      <line_style>
      <line_width>
      (
        (<x> <y> <width> <height>)
        ...
      )
    )
    (
      draw_lines
      <line_style>
      <line_width>
      (
        ((<x1> <y1>) (<x2> <y2>))
        ...
      )
    )
    (
      draw_line_loop
      <line_style>
      <line_width>
      (
        (<x> <y>)
        ...
      )
    )
    (
      draw_line_strip
      <line_style>
      <line_width>
      (
        (<x> <y>)
        ...
      )
    )
    (
      fill_polygon
      <fill_style>
      (
        (<x> <y>)
        ...
      )
    )
    (
      outline_fill_polygon
      <fill_style>
      <line_style>
      <line_width>
      (
        (<x> <y>)
        ...
      )
    )
    (
      draw_line_path
      <line_style>
      <line_width>
      (
        (<x> <y>)
        (
          <path node>
        )
      )
    )
    (
      fill_path
      <fill_style>
      (
        (<x> <y>)
        (
          <path node>
          ...
        )
      )
    )
    (
      outline_fill_path
      <fill_style>
      <line_style>
      <line_width>
      (
        (<x> <y>)
        (
          <path node>
          ...
        )
      )
    )
    (
      text_hint
      (<center_x> <center_y>)
      <rotation>
      <height>
      "text content"
      (
          (<glyph start offset> <glyph end offset)
          ...
      )
    )
  )
)
```

### Path Nodes

```lisp
(horiz <line_width> <x>)
(vert <line_width> <y>)
(line <line_width> <x> <y>)
(bezier <line_width> (<x> <y>) (<x> <y>) (100<x> <y>))
(quadratic_bezier <line_width> (<x> <y>) (<x> <y>))
(arc_ellipse <line_width> <radius_x> <radius_y> <angle> <large_arc> <sweep> (<x> <y>))
(arc_circle <line_width> <radius> <large_arc> <sweep> (<x> <y>))
(close <line_width>)
```

`<line_width>` is either `-` for *no change in line width* or a number defining the new line width for this node.

### Styles

```lisp
(flat <color>)
(linear (<x1> <y1>) (<x2> <y2>) <color_1> <color_2> )
(radial (<x1> <y1>) (<x2> <y2>) <color_1> <color_2> )
```

## Example

```lisp
(tvg 1
  (400 768 1/32 u8888 default)
  (
    (0.906 0.663 0.075)
    (1.000 0.471 0.000)
    (0.251 1.000 0.000)
    (0.722 0.000 0.302)
    (0.373 0.000 0.620)
    (0.573 0.882 0.220)
  )
  (
    (
      fill_rectangles
      (flat 0)
      (
        (25 25 100 15)
        (25 45 100 15)
        (25 65 100 15)
      )
    )
    (
      outline_fill_rectangles
      (flat 0)
      (linear (150 660) (250 710) 1 2 )
      2.5
      (
        (25 105 100 15)
        (25 125 100 15)
        (25 145 100 15)
      )
    )
    (
      draw_lines
      (radial (325 50) (375 75) 1 2 )
      2.5
      (
        ((25 185) (125 195))
        ((25 195) (125 205))
        ((25 205) (125 215))
        ((25 215) (125 225))
      )
    )
  )
)

```

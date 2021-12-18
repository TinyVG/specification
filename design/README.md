# TinyVG Design Files

## Source Files

- `logo.svg`: The TinyVG logo file created with inkscape. Contains all the metadata and is the central authority for the icon.
- `social-media-preview.xcf`: The source of the social media preview for this github repo

## Renders

- `logo.png`: The logo rendered as a PNG file
- `logo.tvg`: The logo as a binary TinyVG file
- `social-media-preview.png`: The exported social media preview

## Aux

- `render.sh`: Renders `logo.svg` into the other logo files. Requires `svgo`, `convert` from ImageMagick and the repo to be built.
- `svgo.config.js`: SVGO configuration

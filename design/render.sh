#!/bin/bash

set -e

function write_log()
{
  echo "$@" >&2
}

ROOT="$(realpath $(dirname $(realpath $0)))"

# PATH="${ROOT}/../src/tools/svg2tvg/bin/Debug/net5.0/linux-x64:${ROOT}/../zig-out/bin:${PATH}"

# Check for tool availability
which convert tvg-text svgo svg2tvgt tvg-render > /dev/null

write_log "Optimize SVG"
svgo --config "${ROOT}/svgo.config.js" --output "${ROOT}/logo.copy.svg" --input "${ROOT}/logo.svg" >&2

write_log "Convert to TVGT"
svg2tvgt "${ROOT}/logo.copy.svg" --output "${ROOT}/logo.tvgt"

write_log "Convert to TVG"
tvg-text "${ROOT}/logo.tvgt" --output "${ROOT}/logo.tvg"

write_log "Render TVG"
tvg-render -g 512x512 --super-sampling 4 "${ROOT}/logo.tvg"

write_log "Convert to PNG"
convert "${ROOT}/logo.tga" "${ROOT}/logo.png" 

write_log "Print statistics"

echo "Source SVG:    $(( $(wc -c < "${ROOT}/logo.svg") ))"
echo "Optimized SVG: $(( $(wc -c < "${ROOT}/logo.copy.svg") ))"
echo "Final TVG:     $(( $(wc -c < "${ROOT}/logo.tvg") ))"
echo "Compression:   $(( 100 * $(wc -c < "${ROOT}/logo.tvg") / $(wc -c < "${ROOT}/logo.copy.svg") ))%"

write_log "Delete intermediate file"
rm "${ROOT}/logo.tga"
rm "${ROOT}/logo.copy.svg"

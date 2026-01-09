#!/bin/bash

# Beautify screenshots for Flathub
# Adds rounded corners, drop shadow, and ensures max 2000x1400

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INPUT_DIR="${SCRIPT_DIR}/../screenshots/flathub/original"
OUTPUT_DIR="${SCRIPT_DIR}/../screenshots/flathub/optimized"

CORNER_RADIUS=12
SHADOW_BLUR=9
SHADOW_OFFSET_Y=3
SHADOW_OPACITY=20

mkdir -p "$OUTPUT_DIR"

process_image() {
    local input="$1"
    local filename=$(basename "$input")
    local output="${OUTPUT_DIR}/${filename}"
    local temp_rounded="/tmp/beautify_rounded_$$_${filename}"

    echo "Processing: $filename"

    magick "$input" \
        \( +clone -alpha extract \
           -draw "fill black polygon 0,0 0,${CORNER_RADIUS} ${CORNER_RADIUS},0 fill white circle ${CORNER_RADIUS},${CORNER_RADIUS} ${CORNER_RADIUS},0" \
           \( +clone -flip \) -compose Multiply -composite \
           \( +clone -flop \) -compose Multiply -composite \
        \) -alpha off -compose CopyOpacity -composite \
        "$temp_rounded"

    magick "$temp_rounded" \
        \( +clone -background black -shadow ${SHADOW_OPACITY}x${SHADOW_BLUR}+0+${SHADOW_OFFSET_Y} \) \
        +swap -background none -layers merge +repage \
        -trim +repage \
        -resize 2000x1400 \
        "$output"

    rm -f "$temp_rounded"
    echo "  -> Saved: $output ($(identify -format '%wx%h' "$output"))"
}

if ! command -v magick &> /dev/null; then
    echo "Error: ImageMagick 7 is not installed"
    echo "Install with: sudo pacman -S imagemagick"
    exit 1
fi

echo "Beautifying screenshots for Flathub..."
echo "Input:  $INPUT_DIR"
echo "Output: $OUTPUT_DIR"
echo ""

for img in "$INPUT_DIR"/*.png; do
    if [[ -f "$img" ]]; then
        process_image "$img"
    fi
done

echo ""
echo "Done! Screenshots saved to: $OUTPUT_DIR"

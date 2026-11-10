#!/bin/bash
# Re-render the carousel: slide-1..6.png (1080x1350) and carousel.pdf (6 pages).
# Usage: ./render.sh /path/to/Rankability/public/fonts
# The argument is the folder holding Graphik-Regular.woff2 and Graphik-Medium.woff2
# (public/fonts in the gotchseo/Rankability repo). Fonts are linked into a temp
# build folder for the render and are never copied into this folder.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
FONTS="${1:?Pass the folder that contains the Graphik .woff2 files}"
CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
for f in Regular Medium; do
  [ -f "$FONTS/Graphik-$f.woff2" ] || { echo "Missing $FONTS/Graphik-$f.woff2" >&2; exit 1; }
done

B="$(mktemp -d)"; trap 'rm -rf "$B"' EXIT
cp "$HERE/carousel.html" "$HERE/carousel.css" "$B/"
cp -R "$HERE/assets" "$B/assets"
ln -s "$(cd "$FONTS" && pwd)" "$B/fonts"
run() { "$CHROME" --headless=new --disable-gpu --hide-scrollbars --no-first-run \
  --user-data-dir="$B/profile" --force-device-scale-factor=1 --virtual-time-budget=4000 "$@" 2>/dev/null; }

# Refuse to export if the real Graphik faces did not load.
STATUS="$(run --dump-dom "file://$B/carousel.html" | grep -o 'data-graphik="[a-z]*"[^>]*' | head -1)"
echo "Font check: $STATUS"
case "$STATUS" in *'data-graphik="loaded"'*) ;; *) echo "Graphik did not load; not exporting." >&2; exit 1;; esac

for n in 1 2 3 4 5 6; do
  run --window-size=1080,1350 --screenshot="$HERE/slide-$n.png" "file://$B/carousel.html?slide=$n"
done
run --no-pdf-header-footer --print-to-pdf="$HERE/carousel.pdf" "file://$B/carousel.html"
echo "Wrote slide-1..6.png and carousel.pdf to $HERE"

#!/usr/bin/env bash
# Build: pure HolyC (no C code). hcc links SDL2 + OpenGL directly. Output: bin/mcpe-holyc
set -euo pipefail
cd "$(dirname "$0")/.."
: "${HCC_PREFIX:=/usr/local}"
: "${HCC:=$HCC_PREFIX/bin/hcc}"
if [ ! -x "$HCC" ] || [ ! -f "$HCC_PREFIX/lib/libtos.a" ]; then
  echo "hcc not found. Install hcc 0.0.17-beta (https://github.com/Jamesbarford/holyc-lang) and set HCC_PREFIX." >&2
  exit 2
fi
have_sdl=0
pkg-config --exists sdl2 2>/dev/null && have_sdl=1
for d in /usr/lib64 /usr/lib /usr/lib/x86_64-linux-gnu /usr/local/lib; do [ -e "$d/libSDL2.so" ] && have_sdl=1; done
[ "$have_sdl" = 1 ] || echo "warning: libSDL2.so not found; if linking fails: sudo apt install libsdl2-dev libgl-dev (Fedora: SDL2-devel mesa-libGL-devel)" >&2
mkdir -p build bin
"$HCC" -O -Werror --install-dir="$HCC_PREFIX" app/main.HC -o build/mcpe-holyc
cp build/mcpe-holyc bin/mcpe-holyc
echo "built bin/mcpe-holyc  (run: ./scripts/run.sh)"
[ -f assets/terrain.tga ] || echo "assets missing: python3 tools/import_assets.py /path/to/PE-a0.8.1.apk" >&2

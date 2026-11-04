#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
[ -x bin/mcpe-holyc ] || { echo "not built: ./scripts/build.sh" >&2; exit 1; }
[ -f assets/terrain.tga ] || { echo "assets missing: python3 tools/import_assets.py /path/to/PE-a0.8.1.apk" >&2; exit 1; }
[ -f assets/031/mob/pig.png ] || { echo "mob skins missing (re-run): python3 tools/import_assets.py /path/to/PE-a0.8.1.apk" >&2; exit 1; }
[ -f assets/033/chest/normal.png ] || { echo "batch033 textures missing (re-run): python3 tools/import_assets.py /path/to/PE-a0.8.1.apk" >&2; exit 1; }
[ -f assets/035/art/kz.png ] || { echo "batch035 textures missing (re-run): python3 tools/import_assets.py /path/to/PE-a0.8.1.apk" >&2; exit 1; }
exec ./bin/mcpe-holyc "$@"

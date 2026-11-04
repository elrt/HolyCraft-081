#!/bin/sh
# Copy the latest save of a port world out as a plain MCPE 0.8.1 world folder
# (level.dat + chunks.dat + entities.dat), e.g. for games/com.mojang/minecraftWorlds/<name>/ on a device.
# Usage: scripts/export_pe.sh WORLD OUTDIR      (WORLD = folder name under worlds/; OUTDIR must not exist)
set -eu
cd "$(dirname "$0")/.."
[ $# -eq 2 ] || { echo "usage: $0 WORLD OUTDIR" >&2; exit 2; }
src="worlds/$1"; out="$2"
[ -f "$src/CURRENT" ] || { echo "$src has no saved snapshot (open and save it in the port first)" >&2; exit 1; }
snap="$src/$(head -n1 "$src/CURRENT")"
for f in level.dat chunks.dat; do [ -f "$snap/$f" ] || { echo "missing $snap/$f" >&2; exit 1; }; done
[ ! -e "$out" ] || { echo "$out already exists; refusing to overwrite" >&2; exit 1; }
mkdir -p "$out"
cp "$snap/level.dat" "$snap/chunks.dat" "$out/"
if [ -f "$snap/entities.dat" ]; then cp "$snap/entities.dat" "$out/"; else echo "note: snapshot predates entities.dat export (Batch 035); mobs/chests are not included until the world is saved once by this build" >&2; fi
echo "exported $snap -> $out"

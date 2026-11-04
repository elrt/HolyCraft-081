# MCPE 0.8.1 → HolyC

A port of **Minecraft: Pocket Edition 0.8.1** (C++) to **HolyC**, compiled to a native
Linux x86_64 executable with [hcc](https://github.com/Jamesbarford/holyc-lang).
Not a TempleOS port: it runs on ordinary Linux.

> 🤖 **Made by AI.** The whole port — code, tests, tools and this README — was written by
> **Claude Opus 5.5** (an AI model), working as an agent. The human author set the goals and tested the game.

**Platform: Linux x86_64 only** (tested). Other platforms are not supported.

**100% HolyC, no C code.** The program calls SDL2 (window, input, audio) and OpenGL
directly. Everything else is HolyC: world generation, blocks, lighting, physics, chunk
rendering, GUI (touch + mouse), inventory, crafting, saving (NBT), sound mixing, mobs.

Single-player only (no multiplayer, no redstone).

## Features

**World and rendering**
- Original world generator, chunk meshes, sky light and block light, smooth lighting (ambient occlusion).
- Day/night cycle: sun, moon phases, stars, clouds, sunrise colours, sky darkening.
- Animated water and lava (still and flowing), sloped liquid surfaces and flow direction like PE.
- Stairs (all 10 kinds, inner/outer corners, upside-down), cactus, fire (slanted flames + animated `FireTexture`),
  fences, cobblestone walls, glass panes and iron bars that connect like PE.
- Block breaking feedback: crack overlay while mining, block particles on hit and on break.
- Falling sand/gravel, melting ice and snow, glowing redstone ore, spreading mushrooms, growing sugar cane and cactus.

**Player**
- Creative and survival, health, fall/fire/lava/cactus/suffocation damage, drowning, 0.5-block step height.
- Player model with armor layers and held item, first-person hand, third-person view (F5), armor screen.
- Original touch GUI (start menu, world list, create/delete world, HUD, D-pad, pause, options, chat) and classic mouse mode.
- Inventory, crafting, stonecutter, chests (incl. double chests), furnace.
- Bow (charge, crits, arrow pickup), snowballs, eggs, mushroom stew, compass and clock, camera, paintings, signs.
- Beds (spawn point, sleeping skips the night), doors, trapdoors, fence gates, cake, TNT with chain explosions,
  farming (hoe, seeds, wheat growth, bone meal, hydration), minecarts and rails (curves, slopes, powered rails, riding).
- Nether reactor (survival): structure check, dome, waves of items and zombie pigmen, obsidian shell.

**Mobs**
- Pig, cow, sheep, chicken: AI goals, A* path finding, breeding, babies, tempting, shearing, milking, eggs, loot.
- Zombie, skeleton, spider, creeper, zombie pigman: night/cave spawning, burning in daylight, difficulty-based damage.
- Shadows and particles (hearts, smoke, bubbles, splash).

**Saves**
- Worlds are real MCPE 0.8.1 worlds (`level.dat` + `chunks.dat` + `entities.dat`).
- A world folder from `games/com.mojang/minecraftWorlds/` can be dropped into `worlds/` and opened.
  The original files are not modified; saves are written as snapshots next to them.
- `scripts/export_pe.sh WORLD DIR` exports the latest save as a plain PE world.
- Compatibility was checked against the original 0.8.1 in both directions (blocks byte-identical, mobs,
  items, chests, inventory, position and time preserved).

**Other**
- Chat commands: `/summon <mob|minecart>`, `/time day|night|noon|N`, `/help`.
- Crash report: on a crash a backtrace is printed and written to `crash.log`
  (`nm -n bin/mcpe-holyc` turns the addresses into function names).

## No Mojang files here

This repository contains **no** Minecraft textures, sounds or text (the title-screen splashes are our own).
You import them locally from **your own** copy of the original APK (`PE-a0.8.1-armv7-gb.apk`):

```sh
python3 tools/import_assets.py /path/to/PE-a0.8.1-armv7-gb.apk
```

## Prebuilt binary

Releases contain `bin/mcpe-holyc` (Linux x86_64, glibc 2.34+: Ubuntu 22.04+, Debian 12+, Fedora 35+).
You still need SDL2 + OpenGL (`sudo apt install libsdl2-2.0-0 libgl1`), zlib, libpng16 and the assets
imported from your own APK:

```sh
python3 tools/import_assets.py /path/to/PE-a0.8.1-armv7-gb.apk
./scripts/run.sh
```

## Build and run

Needs: hcc 0.0.17-beta, SDL2 + OpenGL dev packages, Python 3 (only for the asset import).

```sh
sudo apt install libsdl2-dev libgl-dev    # Fedora: SDL2-devel mesa-libGL-devel
export HCC_PREFIX=/usr/local              # where hcc and lib/libtos.a are installed
./scripts/build.sh
./scripts/run.sh                          # --help for options
./scripts/test.sh                         # headless self-test
```

## Controls

- Touch mode by default: drag = look, tap = place/use/attack, hold = break/use item on mob.
- Options → Controls → *Use touchscreen* off gives classic mouse: LMB break/attack, RMB place/use, wheel = hotbar.
- Keyboard: WASD, Space, Shift, E inventory, T chat, `/` command, 1–9, Q drop, F fly (creative),
  F1 hide GUI, F2 screenshot, F5 third-person view, F6 save, Esc.
- Audio: `MCPE_AUDIO=none|wav:FILE|<SDL driver>`.

## Test scenes

Developer scenes, build a test setup in front of the player (use a new or copied world):
`MCPE_MOBDEMO=1`, `MCPE_BLOCKDEMO=scene|chest|furnace|tnt`, `MCPE_DEMO035=b|p|r|e|d|w|c|h|s|k`
(bow, paintings, reactor, environment damage, drops, liquids, camera, held bow, stairs, block breaking).

## Layout

| Path | What |
|---|---|
| `mcpe.HC` | Ordered list of all modules (the whole program) |
| `src/` | 1:1 ports of the original `headers/` and `impl/` files |
| `runtime/` | Glue that makes the ported modules a running game (world, renderer, GUI, sound, mobs, blocks) |
| `runtime/Batch031Platform.HH` | SDL2/OpenGL/libc bindings written in HolyC |
| `app/main.HC` | Entry point; `app/test.HC` self-test |
| `scripts/` | Build, run, self-test, PE world export |
| `tools/` | Asset + sound importer (from your own APK) |

## Legal

Unofficial fan project, not affiliated with or endorsed by Mojang or Microsoft.
"Minecraft" is a trademark of Mojang Synergies AB.

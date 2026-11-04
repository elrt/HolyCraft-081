# Original 0.8.1 as a compatibility harness

Used to check that worlds round-trip between the HolyC port and the original game.

1. Take the MCPE-0.8.1 decomp sources with submodules (RakNet, jsoncpp, glm, OpenAES), apply
   `patch -p1 < orig-harness.patch` (adds an env-driven harness to `AppPlatform_sdl.cpp`, relaxes GCC flags).
2. Build the OpenAL stub: `gcc -shared -fPIC -o alstub/libopenal.so alstub/stub.c`, then
   `cmake SRC -DDYNAMICSOUNDS=ON -DOPENAL_LIBRARY=$PWD/alstub/libopenal.so -DOPENAL_INCLUDE_DIR=$PWD/alstub/include/AL -DCMAKE_CXX_FLAGS=-I$PWD/alstub/include && make`
   (needs SDL1.2/sdl12-compat, Mesa GL, libcurl dev packages).
3. Run directory: `assets/` from your own APK; worlds live in `games/com.mojang/minecraftWorlds/NAME`.
4. `MCPE_ORIG_WORLD=NAME [MCPE_ORIG_SEED=n] [MCPE_ORIG_SETUP=1] [MCPE_ORIG_FRAMES=n] [MCPE_ORIG_PROBE=x,y,z] ./minecraftpe08decomp`
   opens/creates the world, optionally places a test chest, then prints `HX ...` lines
   (player, entity types, tile entities, inventory signature, block checksum), saves and exits.
5. In the port, `MCPE_PROBE035=x,y,z` prints the same block checksum (`PROBE035 ...`).

Only ever use copies of worlds.

// Port batch 001. Upstream: minecraftpe/headers/level/LevelSettings.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_LEVEL_LEVELSETTINGS_HPP
#define MCPE_HEADERS_LEVEL_LEVELSETTINGS_HPP
class LevelSettings { I32 seed, gameType; };
U0 LevelSettings_Init(LevelSettings *self, I32 seed, I32 gameType) { self->seed=seed; self->gameType=gameType; }
#endif


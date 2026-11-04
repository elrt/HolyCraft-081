// Port batch 001. Upstream: minecraftpe/headers/level/LightLayer.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_LEVEL_LIGHTLAYER_HPP
#define MCPE_HEADERS_LEVEL_LIGHTLAYER_HPP
class LightLayer { I32 baseLight; };
U0 LightLayer_Init(LightLayer *self, I32 baseLight) { self->baseLight=baseLight; }
#endif


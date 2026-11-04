// Port batch 001. Upstream: minecraftpe/headers/level/PRInfo.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_LEVEL_PRINFO_HPP
#define MCPE_HEADERS_LEVEL_PRINFO_HPP
// Entity is opaque until its own batch; this class only stores the pointer.
class PRInfo { U0 *entity; I32 i; };
U0 PRInfo_Init(PRInfo *self, U0 *entity, I32 i) { self->entity=entity; self->i=i; }
#endif


// Batch 003. Source: minecraftpe/headers/rendering/states/EnableState.hpp
#ifndef MCPE_HEADERS_RENDERING_STATES_ENABLESTATE_HPP
#define MCPE_HEADERS_RENDERING_STATES_ENABLESTATE_HPP
class EnableState { U32 enabled; };
U0 EnableState_Init(EnableState *self,U32 cap=0) { self->enabled=cap; if(cap) glEnable(cap); }
EnableState *EnableState_Move(EnableState *self,EnableState *other) { self->enabled=other->enabled;other->enabled=0;return self; }
U0 EnableState_Destroy(EnableState *self) { if(self->enabled) glDisable(self->enabled); self->enabled=0; }

#endif


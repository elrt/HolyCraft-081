// Batch 003. Source: minecraftpe/headers/rendering/states/EnableClientState.hpp
#ifndef MCPE_HEADERS_RENDERING_STATES_ENABLECLIENTSTATE_HPP
#define MCPE_HEADERS_RENDERING_STATES_ENABLECLIENTSTATE_HPP
class EnableClientState { U32 enabled; };
U0 EnableClientState_Init(EnableClientState *self,U32 cap=0) { self->enabled=cap; if(cap) glEnableClientState(cap); }
EnableClientState *EnableClientState_Move(EnableClientState *self,EnableClientState *other) { self->enabled=other->enabled;other->enabled=0;return self; }
U0 EnableClientState_Destroy(EnableClientState *self) { if(self->enabled) glDisableClientState(self->enabled); self->enabled=0; }

#endif


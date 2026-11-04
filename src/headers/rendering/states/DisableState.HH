// Batch 003. Source: minecraftpe/headers/rendering/states/DisableState.hpp
#ifndef MCPE_HEADERS_RENDERING_STATES_DISABLESTATE_HPP
#define MCPE_HEADERS_RENDERING_STATES_DISABLESTATE_HPP
class DisableState { U32 disabled; };
U0 DisableState_Init(DisableState *self,U32 cap=0) { self->disabled=cap; if(cap) glDisable(cap); }
DisableState *DisableState_Move(DisableState *self,DisableState *other) { self->disabled=other->disabled;other->disabled=0;return self; }
U0 DisableState_Destroy(DisableState *self) { if(self->disabled) glEnable(self->disabled); self->disabled=0; }

#endif


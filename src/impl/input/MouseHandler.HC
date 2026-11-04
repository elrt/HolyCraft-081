// Batch 002. Source: minecraftpe/impl/input/MouseHandler.cpp
U0 MouseHandler_Init(MouseHandler *self,ITurnInput *turn) { self->turnInput=turn; }
U0 MouseHandler_Destroy(MouseHandler *self) {}
U0 MouseHandler_setTurnInput(MouseHandler *self,ITurnInput *turn) { self->turnInput=turn; }
U0 MouseHandler_grab(MouseHandler *self) { self->field_0=0; self->field_4=0; }
U0 MouseHandler_release(MouseHandler *self) {}
U0 MouseHandler_poll(MouseHandler *self) { if(self->turnInput) { Vec3 delta; ITurnInput_getTurnDelta(self->turnInput,&delta); self->field_0=delta.x; self->field_4=delta.y; } }


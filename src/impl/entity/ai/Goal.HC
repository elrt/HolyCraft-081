// Batch 004. Source: minecraftpe/impl/entity/ai/Goal.cpp
U0 Goal_Init(Goal *self) { memset(self,0,sizeof(Goal)); }
Bool Goal_canUse(Goal *self) { if(!self->canUseFn) { printf("Abstract Goal.canUse\n");exit(85); } return self->canUseFn(self); }
Bool Goal_canContinueToUse(Goal *self) { if(self->continueFn)return self->continueFn(self);return Goal_canUse(self); }
Bool Goal_canInterrupt(Goal *self) { if(self->interruptFn)return self->interruptFn(self);return TRUE; }
U0 Goal_start(Goal *self) { if(self->startFn)self->startFn(self); }
U0 Goal_stop(Goal *self) { if(self->stopFn)self->stopFn(self); }
U0 Goal_tick(Goal *self) { if(self->tickFn)self->tickFn(self); }
U0 Goal_Destroy(Goal *self) { if(self->destroyFn)self->destroyFn(self); }
U0 Goal_setRequiredControlFlags(Goal *self,I32 flags) { self->controlFlags=flags; }
I32 Goal_getRequiredControlFlags(Goal *self) { return self->controlFlags; }


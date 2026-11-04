// Batch 008: minecraftpe/impl/entity/ai/JumpControl.cpp
U0 JumpControl_Init(JumpControl *self,MCAIActor008 *a) { self->controlledEntity=a;self->isJumping=FALSE; }
U0 JumpControl_jump(JumpControl *self) { self->isJumping=TRUE; }
U0 JumpControl_tick(JumpControl *self) { self->controlledEntity->jumpUpdated=TRUE;self->controlledEntity->jumping=self->isJumping;self->isJumping=FALSE; }

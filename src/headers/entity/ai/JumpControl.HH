// Batch 008: minecraftpe/headers/entity/ai/JumpControl.hpp
class JumpControl { MCAIActor008 *controlledEntity;Bool isJumping; };
U0 JumpControl_Init(JumpControl *self,MCAIActor008 *actor);U0 JumpControl_jump(JumpControl *self);U0 JumpControl_tick(JumpControl *self);

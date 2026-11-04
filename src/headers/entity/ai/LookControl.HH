// Batch 008: minecraftpe/headers/entity/ai/LookControl.hpp
class LookControl { MCAIActor008 *controlledEntity;F32 yawRotationSpeed,pitchRotationSpeed;Bool isLooking;F32 lookX,lookY,lookZ; };
U0 LookControl_Init(LookControl *self,MCAIActor008 *actor);U0 LookControl_setLookAtEntity(LookControl *self,MCAILookTarget008 *target,F32 yawSpeed,F32 pitchSpeed);U0 LookControl_setLookAt(LookControl *self,F32 x,F32 y,F32 z,F32 yawSpeed,F32 pitchSpeed);U0 LookControl_tick(LookControl *self);

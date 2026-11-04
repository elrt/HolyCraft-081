// Batch 008: minecraftpe/headers/entity/ai/BodyControl.hpp
#define BodyControl_maxClampAngle 75.0
class BodyControl { MCAIActor008 *controlledEntity;I32 field_4;F32 field_8; };
U0 BodyControl_Init(BodyControl *self,MCAIActor008 *actor);U0 BodyControl_clientTick(BodyControl *self);

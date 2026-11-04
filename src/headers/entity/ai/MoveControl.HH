// Batch 008: minecraftpe/headers/entity/ai/MoveControl.hpp
#define MoveControl_MIN_SPEED 0.0005
#define MoveControl_MIN_SPEED_SQR 0.00000025
#define MoveControl_MAX_TURN 75.0
class MoveControl { MCAIActor008 *controlledEntity;F32 posX,posY,posZ,speedMultiplier;Bool hasWanted; };
U0 MoveControl_Init(MoveControl *self,MCAIActor008 *actor);F32 MoveControl_getSpeed(MoveControl *self);Bool MoveControl_hasWanted(MoveControl *self);U0 MoveControl_setWantedPosition(MoveControl *self,F32 x,F32 y,F32 z,F32 speed);U0 MoveControl_tick(MoveControl *self);

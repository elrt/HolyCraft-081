#ifndef MCPE_BATCH008_AI_SUPPORT
#define MCPE_BATCH008_AI_SUPPORT
extern "c" F32 atan2f(F32 y,F32 x);
// A simulation snapshot, not Mob/Entity binary layout. Synchronize after every tick.
class MCAIActor008 { F32 posX,posY,posZ,prevX,prevZ,minY,maxY,yaw,pitch,headYaw,bodyYaw,headHeight,baseSpeed,speed,yya;Bool jumping,navigationDone;Bool speedUpdated,yyaUpdated,jumpUpdated;U0 *jumpControl; };
class MCAILookTarget008 { F32 posX,posY,posZ,minY,maxY,headHeight;Bool isMob; };
#endif

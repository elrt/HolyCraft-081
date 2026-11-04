#ifndef MCPE_BATCH011_GAMEPLAY_SUPPORT
#define MCPE_BATCH011_GAMEPLAY_SUPPORT
extern "c" F32 fabsf(F32);
class MCPlayerSnapshot011 {F32 x,y,z,prevX,prevY,prevZ,prevPosX,prevPosY,prevPosZ,motX,motY,motZ,yaw,pitch,prevYaw,prevPitch,fallDistance;I16 fire,air;Bool onGround;U0 *host;U0 (*setPos)(U0 *,F32,F32,F32);};
class MCProjectile011 {U0 *host;Random *sharedRandom;F32 x,y,z,yaw;Bool isClient,removed;I32 renderId,particleItem;U0 (*hurt)(U0 *,U0 *,I32);U0 (*particle)(U0 *,I32,F32,F32,F32,I32);U0 (*chicken)(U0 *,F32,F32,F32,F32,I32);U0 (*remove)(U0 *);};
class MCCamera011 {U0 *host;I32 followEid;F32 x,y,z,prevX,prevY,prevZ,prevPosX,prevPosY,prevPosZ,yaw,pitch,prevYaw,prevPitch;Bool (*findEntity)(U0 *,I32,F32 *,F32 *,F32 *);U0 (*moveTo)(U0 *,F32,F32,F32,F32,F32);U0 (*setPos)(U0 *,F32,F32,F32);};
class MCContainer011 {U0 *host;I32 (*size)(U0 *);MCPacketItem009 *(*get)(U0 *,I32);U0 (*set)(U0 *,I32,MCPacketItem009 *);U0 (*removeItem)(U0 *,I32,I32,MCPacketItem009 *);U8 *(*name)(U0 *);I32 (*maxStackSize)(U0 *);Bool (*stillValid)(U0 *,U0 *);U0 (*startOpen)(U0 *);U0 (*stopOpen)(U0 *);};
#endif

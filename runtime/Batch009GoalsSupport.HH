#ifndef MCPE_BATCH009_GOALS_SUPPORT
#define MCPE_BATCH009_GOALS_SUPPORT
extern "c" F32 cosf(F32 x);
extern "c" F32 sinf(F32 x);
// Host-side adapter, not the original Mob/Level layout. All callback dependencies
// for the goal in use must be provided; calls are intentionally not guessed.
class MCGoalTarget009 { I32 id,age,type; F32 x,y,z,minX,minY,minZ,maxX,maxY,maxZ,headHeight; Bool alive; };
class MCGoalContext009 {
 MCAIActor008 *actor; Random *random; JumpControl *jump; LookControl *look;
 U0 *host,*world;
 Bool inWater,inLava,onFire,isBaby,navDone,hasLastHurtByMob;
 I32 noActionTime,tallgrassID,grassID,dirtID,age,entityType,swellDir; F32 maxHeadXRot,minX,minZ,maxX,maxZ;
 MCGoalTarget009 *(*nearestPlayer)(U0 *host,F32 distance);
 MCGoalTarget009 *(*currentTarget)(U0 *host);
 MCGoalTarget009 *(*lockTarget)(U0 *host,I32 id);
 U0 (*retainTarget)(U0 *host,MCGoalTarget009 *target);
 U0 (*releaseTarget)(U0 *host,I32 id);
 F32 (*distanceToSqr)(U0 *host,MCGoalTarget009 *target);
 Bool (*canSeeTarget)(U0 *host,MCGoalTarget009 *target);
 U0 (*setSwellDir)(U0 *host,I32 dir);
 U0 (*nearbyAnimals)(U0 *host,I32 type,F32 minX,F32 minY,F32 minZ,F32 maxX,F32 maxY,F32 maxZ,MCPtrVector *out);
 U0 (*navMoveEntity)(U0 *host,MCGoalTarget009 *target,F32 speed);
 U0 (*setCanFloat)(U0 *host,Bool value);
 U0 (*setAvoidSun)(U0 *host,Bool value);
 U0 (*navMove)(U0 *host,F32 x,F32 y,F32 z,F32 speed);
 U0 (*navStop)(U0 *host);
 Bool (*randomPos)(U0 *host,I32 horizontal,I32 vertical,Vec3 *out);
 Bool (*isDay)(U0 *world);
 Bool (*canSeeSky)(U0 *world,I32 x,I32 y,I32 z);
 F32 (*walkTargetValue)(U0 *host,I32 x,I32 y,I32 z);
 I32 (*getTile)(U0 *world,I32 x,I32 y,I32 z);
 I32 (*getData)(U0 *world,I32 x,I32 y,I32 z);
 U0 (*broadcastEntityEvent)(U0 *world,U0 *host,I32 event);
 U0 (*levelEvent)(U0 *world,I32 event,I32 x,I32 y,I32 z,I32 data);
 U0 (*setTile)(U0 *world,I32 x,I32 y,I32 z,I32 tile,I32 flags);
 U0 (*ate)(U0 *host);
};
#endif

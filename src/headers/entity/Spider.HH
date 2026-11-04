#ifndef MC020_SPIDER
#define MC020_SPIDER
class Spider: Monster {I32 field_C88;};
U0 Spider_Init(Spider *s,MCMobHost020 *h);
F32 Spider_getModelScale(Spider *s);
Bool Spider_isClimbing(Spider *s);
I32 Spider_makeStepSound(Spider *s);
U0 Spider_setClimbing(Spider *s,Bool climbing);
U0 Spider_tick(Spider *s);
F32 Spider_getShadowRadius(Spider *s);
U0 Spider_makeStuckInWeb(Spider *s);
I32 Spider_getEntityTypeId(Spider *s);
Bool Spider_onLadder(Spider *s);
F32 Spider_getBaseSpeed(Spider *s);
I32 Spider_getMaxHealth(Spider *s);
U0 Spider_aiStep(Spider *s);
I32 Spider_getDeathLoot(Spider *s);
U8 * Spider_getAmbientSound(Spider *s);
U8 * Spider_getHurtSound(Spider *s);
U8 * Spider_getDeathSound(Spider *s);
MCActor020 * Spider_findAttackTarget(Spider *s);
U0 Spider_checkHurtTarget(Spider *s,MCActor020 *t,F32 distance);
U0 Spider_Destroy(Spider *s);
#endif

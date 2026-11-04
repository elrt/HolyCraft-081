#ifndef MC020_MONSTER
#define MC020_MONSTER
class Monster: MCMob020 {I32 attackDamage,lastHurtByMaybe;};
U0 Monster_Init(Monster *s,MCMobHost020 *h);
Bool Monster_isDarkEnoughToSpawn(Monster *s);
U0 Monster_tick(Monster *s);
Bool Monster_hurt(Monster *s,MCActor020 *from,I32 amount);
I32 Monster_getCreatureBaseType(Monster *s);
U0 Monster_aiStep(Monster *s);
Bool Monster_canSpawn(Monster *s);
Bool Monster_doHurtTarget(Monster *s,MCActor020 *target);
F32 Monster_getWalkTargetValue(Monster *s,I32 x,I32 y,I32 z);
MCActor020 * Monster_findAttackTarget(Monster *s);
U0 Monster_checkHurtTarget(Monster *s,MCActor020 *t,F32 distance);
I32 Monster_getAttackDamage(Monster *s,MCActor020 *t);
I32 Monster_getAttackTime(Monster *s);
U0 Monster_Destroy(Monster *s);
#endif

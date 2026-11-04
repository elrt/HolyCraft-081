#ifndef MC020_ANIMAL
#define MC020_ANIMAL
class Animal: MCMob020 {};
U0 Animal_Init(Animal *s,MCMobHost020 *h);
Bool Animal_canMate(Animal *s,Animal *other);
Bool Animal_isInLove(Animal *s);
U0 Animal_resetLove(Animal *s);
Bool Animal_isFood(Animal *s,MCItem020 *item);
Bool Animal_interactWithPlayer(Animal *s,MCActor020 *p);
Bool Animal_hurt(Animal *s,MCActor020 *from,I32 amount);
I32 Animal_getCreatureBaseType(Animal *s);
U0 Animal_readAdditionalSaveData(Animal *s,U0 *tag);
U0 Animal_addAdditonalSaveData(Animal *s,U0 *tag);
I32 Animal_getAmbientSoundInterval(Animal *s);
U0 Animal_aiStep(Animal *s);
Bool Animal_canSpawn(Animal *s);
Bool Animal_removeWhenFarAway(Animal *s);
F32 Animal_getWalkTargetValue(Animal *s,I32 x,I32 y,I32 z);
MCActor020 * Animal_findAttackTarget(Animal *s);
U0 Animal_Destroy(Animal *s);
#endif

#ifndef MC020_PIG
#define MC020_PIG
class Pig: Animal {};
U0 Pig_Init(Pig *s,MCMobHost020 *h);
Bool Pig_hasSaddle(Pig *s);
U0 Pig_setSaddle(Pig *s,Bool saddle);
Bool Pig_interactWithPlayer(Pig *s,MCActor020 *p);
I32 Pig_getEntityTypeId(Pig *s);
F32 Pig_getBaseSpeed(Pig *s);
I32 Pig_getMaxHealth(Pig *s);
Bool Pig_canBeControlledByRider(Pig *s);
I32 Pig_getDeathLoot(Pig *s);
U8 * Pig_getAmbientSound(Pig *s);
U8 * Pig_getHurtSound(Pig *s);
U8 * Pig_getDeathSound(Pig *s);
Bool Pig_useNewAi(Pig *s);
Bool Pig_isFood(Pig *s,MCItem020 *i);
MCMob020 * Pig_getBreedOffspring(Pig *s,Animal *other);
U0 Pig_Destroy(Pig *s);
#endif

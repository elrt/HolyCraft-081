#ifndef MC020_COW
#define MC020_COW
class Cow: Animal {I32 milkedTicks;};
U0 Cow_Init(Cow *s,MCMobHost020 *h);
U0 Cow_tick(Cow *s);
Bool Cow_interactWithPlayer(Cow *s,MCActor020 *p);
I32 Cow_getEntityTypeId(Cow *s);
U0 Cow_readAdditionalSaveData(Cow *s,U0 *tag);
U0 Cow_addAdditonalSaveData(Cow *s,U0 *tag);
F32 Cow_getBaseSpeed(Cow *s);
I32 Cow_getMaxHealth(Cow *s);
I32 Cow_getDeathLoot(Cow *s);
U0 Cow_dropDeathLoot(Cow *s);
F32 Cow_getSoundVolume(Cow *s);
U8 * Cow_getAmbientSound(Cow *s);
U8 * Cow_getHurtSound(Cow *s);
U8 * Cow_getDeathSound(Cow *s);
Bool Cow_useNewAi(Cow *s);
MCMob020 * Cow_getBreedOffspring(Cow *s,Animal *other);
U0 Cow_Destroy(Cow *s);
#endif

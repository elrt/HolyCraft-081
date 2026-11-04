#ifndef MC020_CHICKEN
#define MC020_CHICKEN
class Chicken: Animal {I8 field_C88;F32 field_C8C,field_C90,field_C94,field_C98,field_C9C;I32 nextEggCounter;};
U0 Chicken_Init(Chicken *s,MCMobHost020 *h);
I32 Chicken_getEntityTypeId(Chicken *s);
U0 Chicken_causeFallDamage(Chicken *s,F32 distance);
U0 Chicken_readAdditionalSaveData(Chicken *s,U0 *tag);
U0 Chicken_addAdditonalSaveData(Chicken *s,U0 *tag);
F32 Chicken_getBaseSpeed(Chicken *s);
I32 Chicken_getMaxHealth(Chicken *s);
U0 Chicken_aiStep(Chicken *s);
U0 Chicken_dropDeathLoot(Chicken *s);
U8 * Chicken_getAmbientSound(Chicken *s);
U8 * Chicken_getHurtSound(Chicken *s);
U8 * Chicken_getDeathSound(Chicken *s);
Bool Chicken_useNewAi(Chicken *s);
Bool Chicken_isFood(Chicken *s,MCItem020 *i);
MCMob020 * Chicken_getBreedOffspring(Chicken *s,Animal *other);
U0 Chicken_Destroy(Chicken *s);
#endif

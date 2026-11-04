#ifndef MC020_SKELETON
#define MC020_SKELETON
class Skeleton: Monster {MCItem020 heldItem;I32 skyCheckCounter;};
U0 Skeleton_Init(Skeleton *s,MCMobHost020 *h);
I32 Skeleton_getEntityTypeId(Skeleton *s);
F32 Skeleton_getBaseSpeed(Skeleton *s);
I32 Skeleton_getMaxHealth(Skeleton *s);
U0 Skeleton_aiStep(Skeleton *s);
MCItem020 * Skeleton_getCarriedItem(Skeleton *s);
I32 Skeleton_getDeathLoot(Skeleton *s);
U0 Skeleton_dropDeathLoot(Skeleton *s);
U8 * Skeleton_getAmbientSound(Skeleton *s);
U8 * Skeleton_getHurtSound(Skeleton *s);
U8 * Skeleton_getDeathSound(Skeleton *s);
Bool Skeleton_useNewAi(Skeleton *s);
U0 Skeleton_checkHurtTarget(Skeleton *s,MCActor020 *t,F32 distance);
I32 Skeleton_getUseDuration(Skeleton *s);
U0 Skeleton_Destroy(Skeleton *s);
#endif

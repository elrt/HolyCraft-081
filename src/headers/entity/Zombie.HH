#ifndef MC020_ZOMBIE
#define MC020_ZOMBIE
class Zombie: Monster {I32 skyCheckCounter;Bool usingNewAI;};
U0 Zombie_Init(Zombie *s,MCMobHost020 *h);
U0 Zombie_setUseNewAi(Zombie *s,Bool value);
I32 Zombie_getEntityTypeId(Zombie *s);
U0 Zombie_die(Zombie *s,MCActor020 *t);
F32 Zombie_getBaseSpeed(Zombie *s);
I32 Zombie_getMaxHealth(Zombie *s);
I32 Zombie_getArmorValue(Zombie *s);
U0 Zombie_aiStep(Zombie *s);
I32 Zombie_getDeathLoot(Zombie *s);
U8 * Zombie_getAmbientSound(Zombie *s);
U8 * Zombie_getHurtSound(Zombie *s);
U8 * Zombie_getDeathSound(Zombie *s);
Bool Zombie_useNewAi(Zombie *s);
I32 Zombie_getAttackDamage(Zombie *s,MCActor020 *target);
U0 Zombie_Destroy(Zombie *s);
#endif

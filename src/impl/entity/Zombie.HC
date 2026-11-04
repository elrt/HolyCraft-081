// Ported from minecraftpe/impl/entity/Zombie.cpp; host-facing representation, not C++ ABI.

U0 Zombie_Init(Zombie *s,MCMobHost020 *h) {Monster_Init(s,h);s->a.type=32;s->skyCheckCounter=0;s->usingNewAI=FALSE;s->renderId=11;MCMob020_Skin(s,"mob/zombie.png");s->attackDamage=4;h->navOption(h->ctx,s,1,TRUE);h->addGoal(h->ctx,s,0,0,0,(0)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,1,8,(0)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,2,9,(1)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,6,5,(1)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,7,6,(8)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,7,7,(0)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,1,1,10,(16)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,1,2,11,(16)(F32),NULL,0,FALSE);}
U0 Zombie_setUseNewAi(Zombie *s,Bool value) {s->usingNewAI=value;}
I32 Zombie_getEntityTypeId(Zombie *s) {return 32;}
U0 Zombie_die(Zombie *s,MCActor020 *t) {s->h->baseDie(s->h->ctx,s,t);if(!s->h->isClient){if((Random_genrand_int32(&s->rng)&3)==0)s->h->drop(s->h->ctx,s,s->h->feather,1);if(!Random_nextInt(&s->rng,40))s->h->drop(s->h->ctx,s,s->h->carrot,1);if(!Random_nextInt(&s->rng,40))s->h->drop(s->h->ctx,s,s->h->potato,1);}}
F32 Zombie_getBaseSpeed(Zombie *s) {return 0.23;}
I32 Zombie_getMaxHealth(Zombie *s) {return 12;}
I32 Zombie_getArmorValue(Zombie *s) {I32 v=s->h->baseArmor(s->h->ctx,s)+2;if(v>=20)return 20;return v;}
U0 Zombie_aiStep(Zombie *s) {++s->skyCheckCounter;MCMobHost020 *h=s->h;if((s->skyCheckCounter&1) && h->isDay && !h->isClient && !s->baby && s->brightness>0.5 && !s->fire){if(h->sky(h->ctx,Mth_floor(s->a.x),Mth_floor(s->a.y),Mth_floor(s->a.z)))h->setFire(h->ctx,s,8);}Monster_aiStep(s);}
I32 Zombie_getDeathLoot(Zombie *s) {return 0;}
U8 * Zombie_getAmbientSound(Zombie *s) {return "mob.zombie";}
U8 * Zombie_getHurtSound(Zombie *s) {return "mob.zombiehurt";}
U8 * Zombie_getDeathSound(Zombie *s) {return "mob.zombiedeath";}
Bool Zombie_useNewAi(Zombie *s) {return s->usingNewAI;}
I32 Zombie_getAttackDamage(Zombie *s,MCActor020 *target) {MCItem020 *i=s->h->carried(s->h->ctx,s);I32 damage=s->attackDamage;if(i)damage+=i->attackDamage;return damage;}
U0 Zombie_Destroy(Zombie *s) {Monster_Destroy(s);}

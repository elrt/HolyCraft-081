#ifndef MCPE_BATCH020_MOB_BRIDGE
#define MCPE_BATCH020_MOB_BRIDGE
// Concrete allocation and inherited-method dispatch for six newly ported species.
// This is not a Level entity registry, physics engine or C++ virtual-table ABI.
MCMob020 *MC020_NewMob(MCMobHost020 *h,I32 type) {MCMob020 *s=NULL;
if(type==10){s=MC_Alloc(sizeof(Chicken));Chicken_Init(s(Chicken*),h);}
else if(type==11){s=MC_Alloc(sizeof(Cow));Cow_Init(s(Cow*),h);}
else if(type==12){s=MC_Alloc(sizeof(Pig));Pig_Init(s(Pig*),h);}
else if(type==32){s=MC_Alloc(sizeof(Zombie));Zombie_Init(s(Zombie*),h);}
else if(type==34){s=MC_Alloc(sizeof(Skeleton));Skeleton_Init(s(Skeleton*),h);}
else if(type==35){s=MC_Alloc(sizeof(Spider));Spider_Init(s(Spider*),h);}return s;}
U0 MC020_DeleteMob(MCMob020 *s) {if(!s)return;I32 type=s->a.type;
if(type==10)Chicken_Destroy(s(Chicken*));else if(type==11)Cow_Destroy(s(Cow*));else if(type==12)Pig_Destroy(s(Pig*));else if(type==32)Zombie_Destroy(s(Zombie*));else if(type==34)Skeleton_Destroy(s(Skeleton*));else if(type==35)Spider_Destroy(s(Spider*));else return;free(s);}
Bool MC020_MobFood(MCMob020 *s,MCItem020 *item) {if(s->a.type==10)return Chicken_isFood(s(Chicken*),item);if(s->a.type==11)return Animal_isFood(s(Animal*),item);if(s->a.type==12)return Pig_isFood(s(Pig*),item);return FALSE;}
U0 MC020_MobTick(MCMob020 *s) {I32 type=s->a.type;if(type==11)Cow_tick(s(Cow*));else if(type==35)Spider_tick(s(Spider*));else if(type==32 || type==34)Monster_tick(s(Monster*));else if(type==10 || type==12)s->h->baseTick(s->h->ctx,s);}
U0 MC020_MobAiStep(MCMob020 *s) {I32 type=s->a.type;if(type==10)Chicken_aiStep(s(Chicken*));else if(type==11 || type==12)Animal_aiStep(s(Animal*));else if(type==32)Zombie_aiStep(s(Zombie*));else if(type==34)Skeleton_aiStep(s(Skeleton*));else if(type==35)Spider_aiStep(s(Spider*));}
Bool MC020_MobHurt(MCMob020 *s,MCActor020 *from,I32 amount) {I32 type=s->a.type;if(type==10 || type==11 || type==12)return Animal_hurt(s(Animal*),from,amount);if(type==32 || type==34 || type==35)return Monster_hurt(s(Monster*),from,amount);return FALSE;}
#endif

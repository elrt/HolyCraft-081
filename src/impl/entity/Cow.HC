// Ported from minecraftpe/impl/entity/Cow.cpp; host-facing representation, not C++ ABI.

U0 Cow_Init(Cow *s,MCMobHost020 *h) {Animal_Init(s,h);s->a.type=11;s->milkedTicks=0;s->renderId=7;MCMob020_Skin(s,"mob/cow.png");MCMob020_Size(s,0.9,1.3);I32 food=h->wheat;MCMob020_AnimalGoals(s,0.8,&food,1,TRUE);}
U0 Cow_tick(Cow *s) {++s->milkedTicks;s->h->baseTick(s->h->ctx,s);}
Bool Cow_interactWithPlayer(Cow *s,MCActor020 *p) {MCItem020 *i=p->selected;MCMobHost020 *h=s->h;if(s->milkedTicks<=20 || !i || !i->isBucket || !h->bucket || i->aux || p->instabuild)return Animal_interactWithPlayer(s,p);s->milkedTicks=p->instabuild;MCItem020 milk;memset(&milk,0,sizeof(MCItem020));milk.id=h->bucket;milk.count=1;milk.aux=1;milk.hasClass=TRUE;milk.isBucket=TRUE;--i->count;if(i->count)h->inventoryAdd(h->ctx,p,&milk);else *i=milk;return TRUE;}
I32 Cow_getEntityTypeId(Cow *s) {return 11;}
U0 Cow_readAdditionalSaveData(Cow *s,U0 *tag) {Animal_readAdditionalSaveData(s,tag);}
U0 Cow_addAdditonalSaveData(Cow *s,U0 *tag) {Animal_addAdditonalSaveData(s,tag);}
F32 Cow_getBaseSpeed(Cow *s) {return 0.2;}
I32 Cow_getMaxHealth(Cow *s) {return 10;}
I32 Cow_getDeathLoot(Cow *s) {return s->h->leather;}
U0 Cow_dropDeathLoot(Cow *s) {I32 i,n=Random_genrand_int32(&s->rng)%3;for(i=0;i<n;i++)s->h->drop(s->h->ctx,s,s->h->leather,1);n=Random_genrand_int32(&s->rng)%3;for(i=0;i<=n;i++)s->h->drop(s->h->ctx,s,MCMob020_Beef(s),1);}
F32 Cow_getSoundVolume(Cow *s) {return 0.4;}
U8 * Cow_getAmbientSound(Cow *s) {return "mob.cow";}
U8 * Cow_getHurtSound(Cow *s) {return "mob.cowhurt";}
U8 * Cow_getDeathSound(Cow *s) {return "mob.cowhurt";}
Bool Cow_useNewAi(Cow *s) {return TRUE;}
MCMob020 * Cow_getBreedOffspring(Cow *s,Animal *other) {return s->h->newMob(s->h->ctx,11);}
U0 Cow_Destroy(Cow *s) {Animal_Destroy(s);}

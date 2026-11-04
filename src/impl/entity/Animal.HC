// Ported from minecraftpe/impl/entity/Animal.cpp; host-facing representation, not C++ ABI.

U0 Animal_Init(Animal *s,MCMobHost020 *h) {MCMob020_Init(s,h,2);s->a.inLove=0;}
Bool Animal_canMate(Animal *s,Animal *other) {return s!=other && other->a.type==s->a.type && s->a.inLove>0 && other->a.inLove>0;}
Bool Animal_isInLove(Animal *s) {return s->a.inLove>0;}
U0 Animal_resetLove(Animal *s) {s->a.inLove=0;}
Bool Animal_isFood(Animal *s,MCItem020 *item) {return item->id==s->h->wheat;}
Bool Animal_interactWithPlayer(Animal *s,MCActor020 *p) {MCMobHost020 *h=s->h;MCItem020 *item=p->selected;if(!item || !h->isFood(h->ctx,s,item) || s->baby || s->a.age!=0)return h->baseInteract(h->ctx,s,p);if(!p->instabuild)--item->count;s->a.inLove=600;s->attackTarget=0;I32 i;for(i=0;i<7;i++)MCMob020_Heart(s);return TRUE;}
Bool Animal_hurt(Animal *s,MCActor020 *from,I32 amount) {s->panicTicks=60;s->attackTarget=0;s->a.inLove=0;return s->h->baseHurt(s->h->ctx,s,from,amount);}
I32 Animal_getCreatureBaseType(Animal *s) {return 2;}
U0 Animal_readAdditionalSaveData(Animal *s,U0 *tag) {MCMobHost020 *h=s->h;h->readAge(h->ctx,s,tag);s->a.inLove=h->getInt(h->ctx,tag,"InLove");}
U0 Animal_addAdditonalSaveData(Animal *s,U0 *tag) {MCMobHost020 *h=s->h;h->writeAge(h->ctx,s,tag);h->putInt(h->ctx,tag,"InLove",s->a.inLove);}
I32 Animal_getAmbientSoundInterval(Animal *s) {return 240;}
U0 Animal_aiStep(Animal *s) {s->h->baseAi(s->h->ctx,s);if(s->a.age>0){--s->a.age;s->h->setAge(s->h->ctx,s,s->a.age);}else if(s->a.age<0){++s->a.age;s->h->setAge(s->h->ctx,s,s->a.age);}if(s->a.age!=0)s->a.inLove=0;if(s->a.inLove>0){--s->a.inLove;if(!(s->a.inLove&15))MCMob020_Heart(s);}}
Bool Animal_canSpawn(Animal *s) {MCMobHost020 *h=s->h;I32 x=Mth_floor(s->a.x),y=Mth_floor(s->a.y),z=Mth_floor(s->a.z);return h->getTile(h->ctx,x,y-1,z)==h->grass && h->rawLight(h->ctx,x,y,z)>8 && h->baseSpawn(h->ctx,s);}
Bool Animal_removeWhenFarAway(Animal *s) {return FALSE;}
F32 Animal_getWalkTargetValue(Animal *s,I32 x,I32 y,I32 z) {MCMobHost020 *h=s->h;if(h->getTile(h->ctx,x,y-1,z)==h->grass)return 10;return h->light(h->ctx,x,y,z)-0.5;}
MCActor020 * Animal_findAttackTarget(Animal *s) {return NULL;}
U0 Animal_Destroy(Animal *s) {MCMob020_Destroy(s);}

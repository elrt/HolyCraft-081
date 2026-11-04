// Ported from minecraftpe/impl/entity/Pig.cpp; host-facing representation, not C++ ABI.

U0 Pig_Init(Pig *s,MCMobHost020 *h) {Animal_Init(s,h);s->a.type=12;s->renderId=8;MCMob020_Skin(s,"mob/pig.png");MCMob020_Size(s,0.9,0.9);h->defineByte(h->ctx,s,16,0);I32 foods[3]={h->potato,h->carrot,h->beetroot};MCMob020_AnimalGoals(s,1,foods,3,TRUE);}
Bool Pig_hasSaddle(Pig *s) {return s->h->getByte(s->h->ctx,s,16)&1;}
U0 Pig_setSaddle(Pig *s,Bool saddle) {s->h->setByte(s->h->ctx,s,16,saddle);}
Bool Pig_interactWithPlayer(Pig *s,MCActor020 *p) {return Animal_interactWithPlayer(s,p);}
I32 Pig_getEntityTypeId(Pig *s) {return 12;}
F32 Pig_getBaseSpeed(Pig *s) {return 0.25;}
I32 Pig_getMaxHealth(Pig *s) {return 10;}
Bool Pig_canBeControlledByRider(Pig *s) {return s->rider && s->rider->isPlayer && s->rider->selected!=NULL;}
I32 Pig_getDeathLoot(Pig *s) {if(s->fire)return s->h->porkCooked;return s->h->porkRaw;}
U8 * Pig_getAmbientSound(Pig *s) {return "mob.pig";}
U8 * Pig_getHurtSound(Pig *s) {return "mob.pig";}
U8 * Pig_getDeathSound(Pig *s) {return "mob.pigdeath";}
Bool Pig_useNewAi(Pig *s) {return TRUE;}
Bool Pig_isFood(Pig *s,MCItem020 *i) {return i->id==s->h->potato || i->id==s->h->carrot || i->id==s->h->beetroot;}
MCMob020 * Pig_getBreedOffspring(Pig *s,Animal *other) {return s->h->newMob(s->h->ctx,12);}
U0 Pig_Destroy(Pig *s) {Animal_Destroy(s);}

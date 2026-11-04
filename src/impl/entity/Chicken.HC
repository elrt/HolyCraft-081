// Ported from minecraftpe/impl/entity/Chicken.cpp; host-facing representation, not C++ ABI.

U0 Chicken_Init(Chicken *s,MCMobHost020 *h) {Animal_Init(s,h);s->a.type=10;s->field_C88=0;s->field_C8C=0;s->field_C90=0;s->field_C94=0;s->field_C98=0;s->field_C9C=1;s->renderId=6;MCMob020_Skin(s,"mob/chicken.png");s->nextEggCounter=Random_genrand_int32(&s->rng)%6000+6000;MCMob020_Size(s,0.3,0.7);I32 food=h->seeds;MCMob020_AnimalGoals(s,1,&food,1,FALSE);}
I32 Chicken_getEntityTypeId(Chicken *s) {return 10;}
U0 Chicken_causeFallDamage(Chicken *s,F32 distance) {}
U0 Chicken_readAdditionalSaveData(Chicken *s,U0 *tag) {Animal_readAdditionalSaveData(s,tag);}
U0 Chicken_addAdditonalSaveData(Chicken *s,U0 *tag) {Animal_addAdditonalSaveData(s,tag);}
F32 Chicken_getBaseSpeed(Chicken *s) {return 0.25;}
I32 Chicken_getMaxHealth(Chicken *s) {return 4;}
U0 Chicken_aiStep(Chicken *s) {Animal_aiStep(s);F32 old=s->field_C8C;s->field_C98=old;s->field_C94=s->field_C90;Bool ground=s->onGround;F32 change=-0.3;if(!ground)change=1.2;F32 wing=s->field_C90+change;if(wing<0)wing=0;s->field_C90=wing;if(wing>1)s->field_C90=1;if(!ground && s->field_C9C<1)s->field_C9C=1;F32 speed=s->field_C9C*0.9;s->field_C9C=speed;if(!ground && s->motionY<0)s->motionY*=0.6;s->field_C8C=old+(speed+speed);if(!s->baby && !s->h->isClient){--s->nextEggCounter;if(s->nextEggCounter<=0){F32 pitch=(Random_nextFloat(&s->rng)-Random_nextFloat(&s->rng))*0.2+1;s->h->sound(s->h->ctx,s,"mob.chickenplop",(1)(F32),(pitch)(F32));s->h->drop(s->h->ctx,s,s->h->egg,1);s->nextEggCounter=Random_genrand_int32(&s->rng)%6000+6000;}}}
U0 Chicken_dropDeathLoot(Chicken *s) {I32 i;for(i=0;i<Random_genrand_int32(&s->rng)%3;i++)s->h->drop(s->h->ctx,s,s->h->feather,1);s->h->drop(s->h->ctx,s,MCMob020_ChickenMeat(s),1);}
U8 * Chicken_getAmbientSound(Chicken *s) {return "mob.chicken";}
U8 * Chicken_getHurtSound(Chicken *s) {return "mob.chickenhurt";}
U8 * Chicken_getDeathSound(Chicken *s) {return "mob.chickenhurt";}
Bool Chicken_useNewAi(Chicken *s) {return TRUE;}
Bool Chicken_isFood(Chicken *s,MCItem020 *i) {return i->hasClass && i->isSeed;}
MCMob020 * Chicken_getBreedOffspring(Chicken *s,Animal *other) {return s->h->newMob(s->h->ctx,10);}
U0 Chicken_Destroy(Chicken *s) {Animal_Destroy(s);}

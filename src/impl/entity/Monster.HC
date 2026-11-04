// Ported from minecraftpe/impl/entity/Monster.cpp; host-facing representation, not C++ ABI.

U0 Monster_Init(Monster *s,MCMobHost020 *h) {MCMob020_Init(s,h,1);s->attackDamage=2;s->lastHurtByMaybe=0;s->renderId=3;}
Bool Monster_isDarkEnoughToSpawn(Monster *s) {MCMobHost020 *h=s->h;I32 x=Mth_floor(s->a.x),y=Mth_floor(s->a.minY),z=Mth_floor(s->a.z);if(h->skyLight(h->ctx,x,y,z)>(Random_genrand_int32(&s->rng)&31))return FALSE;return h->rawLight(h->ctx,x,y,z)<=(Random_genrand_int32(&s->rng)&7);}
U0 Monster_tick(Monster *s) {s->h->baseTick(s->h->ctx,s);if(!s->h->isClient && !s->h->difficulty)s->h->remove(s->h->ctx,s);}
Bool Monster_hurt(Monster *s,MCActor020 *from,I32 amount) {if(!s->h->baseHurt(s->h->ctx,s,from,amount))return FALSE;if(s->rider!=from && s->ridingAt!=from && &s->a!=from){s->attackTarget=0;if(from){s->attackTarget=from->id;if(from->isMob)s->lastHurtByMaybe=from->id;}}return TRUE;}
I32 Monster_getCreatureBaseType(Monster *s) {return 1;}
U0 Monster_aiStep(Monster *s) {s->h->attackAnim(s->h->ctx,s);if(s->brightness>0.5)s->noActionTime+=2;s->h->baseAi(s->h->ctx,s);}
Bool Monster_canSpawn(Monster *s) {return Monster_isDarkEnoughToSpawn(s) && s->h->baseSpawn(s->h->ctx,s);}
Bool Monster_doHurtTarget(Monster *s,MCActor020 *target) {s->h->swing(s->h->ctx,s);return s->h->hurtTarget(s->h->ctx,s,target,s->attackDamage);}
F32 Monster_getWalkTargetValue(Monster *s,I32 x,I32 y,I32 z) {return 0.5-s->h->light(s->h->ctx,x,y,z);}
MCActor020 * Monster_findAttackTarget(Monster *s) {MCActor020 *p=s->h->nearest(s->h->ctx,s,(16)(F32));if(!p || !s->h->canSee(s->h->ctx,s,p))return NULL;return p;}
U0 Monster_checkHurtTarget(Monster *s,MCActor020 *t,F32 distance) {if(s->attackTime<=0 && distance<2 && t->maxY>s->a.minY && t->minY<s->a.maxY){s->attackTime=20;Monster_doHurtTarget(s,t);}}
I32 Monster_getAttackDamage(Monster *s,MCActor020 *t) {return s->attackDamage;}
I32 Monster_getAttackTime(Monster *s) {return 20;}
U0 Monster_Destroy(Monster *s) {MCMob020_Destroy(s);}

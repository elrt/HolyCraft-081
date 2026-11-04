// Ported from minecraftpe/impl/entity/Spider.cpp; host-facing representation, not C++ ABI.

U0 Spider_Init(Spider *s,MCMobHost020 *h) {Monster_Init(s,h);s->a.type=35;s->field_C88=0;s->renderId=13;MCMob020_Skin(s,"mob/spider.png");MCMob020_Size(s,1.4,0.9);h->defineByte(h->ctx,s,16,0);}
F32 Spider_getModelScale(Spider *s) {return 1;}
Bool Spider_isClimbing(Spider *s) {return s->h->getByte(s->h->ctx,s,16)&1;}
I32 Spider_makeStepSound(Spider *s) {return 0;}
U0 Spider_setClimbing(Spider *s,Bool climbing) {I8 b=s->h->getByte(s->h->ctx,s,16),v=b&0xfe;if(climbing)v=b|1;s->h->setByte(s->h->ctx,s,16,v);}
U0 Spider_tick(Spider *s) {Monster_tick(s);if(!s->h->isClient)Spider_setClimbing(s,s->collidedH);}
F32 Spider_getShadowRadius(Spider *s) {return s->a.width*0.7;}
U0 Spider_makeStuckInWeb(Spider *s) {}
I32 Spider_getEntityTypeId(Spider *s) {return 35;}
Bool Spider_onLadder(Spider *s) {return Spider_isClimbing(s);}
F32 Spider_getBaseSpeed(Spider *s) {return 0.3;}
I32 Spider_getMaxHealth(Spider *s) {return 8;}
U0 Spider_aiStep(Spider *s) {Monster_aiStep(s);}
I32 Spider_getDeathLoot(Spider *s) {return s->h->stringId;}
U8 * Spider_getAmbientSound(Spider *s) {return "mob.spider";}
U8 * Spider_getHurtSound(Spider *s) {return "mob.spider";}
U8 * Spider_getDeathSound(Spider *s) {return "mob.spiderdeath";}
MCActor020 * Spider_findAttackTarget(Spider *s) {if(s->brightness>=0.5)return NULL;return s->h->nearest(s->h->ctx,s,(16)(F32));}
U0 Spider_checkHurtTarget(Spider *s,MCActor020 *t,F32 distance) {if(s->brightness<=0.5 || Random_nextInt(&s->rng,100)){if(distance<=2 || distance>=6 || Random_nextInt(&s->rng,10)!=0)Monster_checkHurtTarget(s,t,distance);else if(s->onGround){F32 x=t->x-s->a.x,z=t->z-s->a.z;s->motionY=0.4;F32 d=sqrt(x*x+z*z);s->motionX=s->motionX*0.2+((x/d)*0.5)*0.8;s->motionZ=s->motionZ*0.2+((z/d)*0.5)*0.8;}}else s->attackTarget=0;}
U0 Spider_Destroy(Spider *s) {Monster_Destroy(s);}

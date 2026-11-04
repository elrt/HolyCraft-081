// Ported from minecraftpe/impl/entity/Skeleton.cpp; host-facing representation, not C++ ABI.

U0 Skeleton_Init(Skeleton *s,MCMobHost020 *h) {Monster_Init(s,h);s->a.type=34;memset(&s->heldItem,0,sizeof(MCItem020));s->heldItem.id=h->bow;s->heldItem.count=1;s->heldItem.hasClass=TRUE;s->heldItem.isBow=TRUE;s->renderId=12;s->skyCheckCounter=0;MCMob020_Skin(s,"mob/skeleton.png");h->addGoal(h->ctx,s,0,1,0,(0)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,2,12,(0)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,3,13,(1)(F32),NULL,0,FALSE);I32 a[2]={1,60};h->addGoal(h->ctx,s,0,4,14,(1)(F32),a,2,FALSE);h->addGoal(h->ctx,s,0,5,5,(1)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,6,6,(8)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,6,7,(0)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,1,10,(16)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,2,11,(16)(F32),NULL,0,FALSE);}
I32 Skeleton_getEntityTypeId(Skeleton *s) {return 34;}
F32 Skeleton_getBaseSpeed(Skeleton *s) {return 0.25;}
I32 Skeleton_getMaxHealth(Skeleton *s) {return 10;}
U0 Skeleton_aiStep(Skeleton *s) {++s->skyCheckCounter;MCMobHost020 *h=s->h;if(s->skyCheckCounter%2!=0 && h->isDay && !h->isClient && s->brightness>0.5 && !s->fire){if(h->sky(h->ctx,Mth_floor(s->a.x),Mth_floor(s->a.y),Mth_floor(s->a.z)))h->setFire(h->ctx,s,8);}Monster_aiStep(s);}
MCItem020 * Skeleton_getCarriedItem(Skeleton *s) {return &s->heldItem;}
I32 Skeleton_getDeathLoot(Skeleton *s) {return s->h->arrow;}
U0 Skeleton_dropDeathLoot(Skeleton *s) {I32 i,n=Random_genrand_int32(&s->rng)%3;for(i=0;i<n;i++)s->h->drop(s->h->ctx,s,s->h->arrow,1);n=Random_genrand_int32(&s->rng)%3;for(i=0;i<n;i++)s->h->drop(s->h->ctx,s,s->h->bone,1);}
U8 * Skeleton_getAmbientSound(Skeleton *s) {return "mob.skeleton";}
U8 * Skeleton_getHurtSound(Skeleton *s) {return "mob.skeletonhurt";}
U8 * Skeleton_getDeathSound(Skeleton *s) {return "mob.skeletonhurt";}
Bool Skeleton_useNewAi(Skeleton *s) {return FALSE;}
U0 Skeleton_checkHurtTarget(Skeleton *s,MCActor020 *t,F32 distance) {if(distance<10){F32 x=t->x-s->a.x,z=t->z-s->a.z;MCMobHost020 *h=s->h;if(s->attackTime==0){U0 *arrow=h->newArrow(h->ctx,s,(1)(F32));F32 y=((t->y+t->headHeight)-0.7)-h->arrowY(h->ctx,arrow);F32 d=sqrt(x*x+z*z);h->sound(h->ctx,s,"random.bow",(1)(F32),(1/(Random_nextFloat(&s->rng)*0.4+0.8))(F32));h->addEntity(h->ctx,arrow);h->shoot(h->ctx,arrow,(x)(F32),(y+d*0.2)(F32),(z)(F32),(1.6)(F32),(32)(F32));s->attackTime=60;}s->holdGround=TRUE;s->a.yaw=Mth_rad2deg(atan2f(z,x))-90;}}
I32 Skeleton_getUseDuration(Skeleton *s) {return s->attackTime;}
U0 Skeleton_Destroy(Skeleton *s) {Monster_Destroy(s);}

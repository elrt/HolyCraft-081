// Batch023: entity/Sheep; explicit simulation ABI, see docs/BATCH023.md.
U0 Sheep_Init(Sheep *s,MCWorld023 *w) {memset(s,0,sizeof(Sheep));MC023_BodyInit(s,w,13,0.9,1.3);s->health=8;s->isMob=TRUE;}
I32 Sheep_getColor(Sheep *s) {return s->data16&15;}
U0 Sheep_setColor(Sheep *s,I32 color) {s->data16=(s->data16&240)|(color&15);}
Bool Sheep_isSheared(Sheep *s) {return (s->data16&16)!=0;}
U0 Sheep_setSheared(Sheep *s,Bool value) {if(value)s->data16|=16;else s->data16&=239;}
I32 Sheep_getRandomSheepColor(Random *r) {I32 v=Random_genrand_int32(r)%100;if(v<5)return 15;if(v<10)return 7;if(v<15)return 8;if(v<18)return 12;if(Random_genrand_int32(r)%500==0)return 6;return 0;}
F32 Sheep_getHeadEatAngleScale(Sheep *s,F32 p) {I32 n=s->eatAnimation;if(n>=5 && n<=36)return Mth_PI*0.07*Mth_sin((n-4-p)*0.03125*28.7)+Mth_PI*0.2;if(n<=0)return s->pitch*Mth_PI/180.0;return Mth_PI*0.2;}
F32 Sheep_getHeadEatPositionScale(Sheep *s,F32 p) {I32 n=s->eatAnimation;if(n<=0)return 0;if(n>=4 && n<=36)return 1;if(n>3)return -(n-40-p)*0.25;return (n-p)*0.25;}
U0 Sheep_ate(Sheep *s) {Sheep_setSheared(s,FALSE);if(s->baby){s->age+=1200;if(s->age>0)s->age=0;}}
U0 Sheep_handleEntityEvent(Sheep *s,I32 event) {if(event==10)s->eatAnimation=40;}
U0 Sheep_aiStep(Sheep *s) {if(s->w->isClient && s->eatAnimation>0)s->eatAnimation--;MC023_Event(s->w,MC023_BASE_AI,0,0,0,0,0,0,s);}
Bool Sheep_interact(Sheep *s,MCPlayer023 *p) {ItemInstance *item=Inventory_getSelected(p->inventory);if(item && ItemInstance_getId(item)==s->w->registry->shears && !Sheep_isSheared(s) && !s->baby){if(!s->w->isClient){Sheep_setSheared(s,TRUE);I32 i;for(i=0;i<=(Random_genrand_int32(&s->rng)%3)(I32);i++){MC023_Event(s->w,MC023_DROP,s->x,s->y+1,s->z,s->w->registry->wool,Sheep_getColor(s),1);/* Consume original drop-motion RNG; backend receives semantic drops. */Random_nextFloat(&s->rng);Random_nextFloat(&s->rng);Random_nextFloat(&s->rng);Random_nextFloat(&s->rng);Random_nextFloat(&s->rng);}}if(!p->instabuildMode)ItemInstance_hurtAndBreak(item,1,p);}MC023_Event(s->w,MC023_INTERACT,0,0,0,0,0,0,s,p);return FALSE;}
U0 Sheep_save(Sheep *s,CompoundTag *t) {MC023_NBTPut(t,"Sheared",Sheep_isSheared(s),TRUE);MC023_NBTPut(t,"Color",Sheep_getColor(s),TRUE);}
U0 Sheep_load(Sheep *s,CompoundTag *t) {Sheep_setSheared(s,MC023_NBTGet(t,"Sheared",TRUE)!=0);Sheep_setColor(s,MC023_NBTGet(t,"Color",TRUE));}

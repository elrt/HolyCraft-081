// Batch 009: minecraftpe/impl/entity/ai/goals/EatTileGoal.cpp
U0 EatTileGoal_Init(EatTileGoal *s,MCGoalContext009 *h) { Goal_Init(&s->base);s->base.context=s;s->base.canUseFn=&EatTileGoal_canUse;s->base.continueFn=&EatTileGoal_canContinueToUse;s->base.startFn=&EatTileGoal_start;s->base.stopFn=&EatTileGoal_stop;s->base.tickFn=&EatTileGoal_tick;s->holder=h;s->level=h->world;s->ticksLeft=0;Goal_setRequiredControlFlags(&s->base,7); }
Bool EatTileGoal_canUse(Goal *b) { EatTileGoal *s=b->context;MCGoalContext009 *h=s->holder;I32 x,y,z,divisor=1000;if(h->isBaby)divisor=50;if(Random_genrand_int32(h->random)%divisor)return FALSE;x=Mth_floor(h->actor->posX);y=Mth_floor(h->actor->posY);z=Mth_floor(h->actor->posZ);if(h->getTile(s->level,x,y,z)==h->tallgrassID && h->getData(s->level,x,y,z)==1)return TRUE;return h->getTile(s->level,x,y-1,z)==h->grassID; }
Bool EatTileGoal_canContinueToUse(Goal *b) { EatTileGoal *s=b->context;return s->ticksLeft>0; }
U0 EatTileGoal_start(Goal *b) { EatTileGoal *s=b->context;MCGoalContext009 *h=s->holder;s->ticksLeft=40;h->broadcastEntityEvent(s->level,h->host,10);h->navStop(h->host); }
U0 EatTileGoal_stop(Goal *b) { EatTileGoal *s=b->context;s->ticksLeft=0; }
U0 EatTileGoal_tick(Goal *b) { EatTileGoal *s=b->context;MCGoalContext009 *h=s->holder;I32 x,y,z,id;s->ticksLeft--;if(s->ticksLeft<0)s->ticksLeft=0;if(s->ticksLeft==4) { x=Mth_floor(h->actor->posX);y=Mth_floor(h->actor->posY)-1;z=Mth_floor(h->actor->posZ);id=h->getTile(s->level,x,y,z);if(id==h->grassID) { h->levelEvent(s->level,2001,x,y,z,id);h->setTile(s->level,x,y,z,h->dirtID,4);h->ate(h->host); } } }
I32 EatTileGoal_getEatAnimationTick(EatTileGoal *s) { return s->ticksLeft; }
U0 EatTileGoal_setLevel(EatTileGoal *s,U0 *level) { s->level=level; }

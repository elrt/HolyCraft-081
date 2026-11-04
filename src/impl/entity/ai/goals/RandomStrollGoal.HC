// Batch 009: minecraftpe/impl/entity/ai/goals/RandomStrollGoal.cpp
U0 RandomStrollGoal_Init(RandomStrollGoal *s,MCGoalContext009 *h,F32 speed) { Goal_Init(&s->base);s->base.context=s;s->base.canUseFn=&RandomStrollGoal_canUse;s->base.continueFn=&RandomStrollGoal_canContinueToUse;s->base.startFn=&RandomStrollGoal_start;s->holder=h;s->speedMultiplier=speed;Vec3_Init(&s->target);Goal_setRequiredControlFlags(&s->base,3); }
Bool RandomStrollGoal_canUse(Goal *b) { RandomStrollGoal *s=b->context;MCGoalContext009 *h=s->holder;Vec3 p;Vec3_Init(&p);if(h->noActionTime>99 || Random_genrand_int32(h->random)%120)return FALSE;if(!h->randomPos(h->host,10,7,&p))return FALSE;s->target=p;return TRUE; }
Bool RandomStrollGoal_canContinueToUse(Goal *b) { RandomStrollGoal *s=b->context;return !s->holder->navDone; }
U0 RandomStrollGoal_start(Goal *b) { RandomStrollGoal *s=b->context;s->holder->navMove(s->holder->host,s->target.x,s->target.y,s->target.z,s->speedMultiplier); }

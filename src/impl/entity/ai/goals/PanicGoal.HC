// Batch 009: minecraftpe/impl/entity/ai/goals/PanicGoal.cpp
U0 PanicGoal_Init(PanicGoal *s,MCGoalContext009 *h,F32 speed) { Goal_Init(&s->base);s->base.context=s;s->base.canUseFn=&PanicGoal_canUse;s->base.continueFn=&PanicGoal_canContinueToUse;s->base.startFn=&PanicGoal_start;s->holder=h;s->speedMultiplier=speed;Vec3_Init(&s->target);Goal_setRequiredControlFlags(&s->base,1); }
Bool PanicGoal_canUse(Goal *b) { PanicGoal *s=b->context;MCGoalContext009 *h=s->holder;Vec3 p;Vec3_Init(&p);if(!h->hasLastHurtByMob || !h->randomPos(h->host,5,4,&p))return FALSE;s->target=p;return TRUE; }
Bool PanicGoal_canContinueToUse(Goal *b) { PanicGoal *s=b->context;return !s->holder->navDone; }
U0 PanicGoal_start(Goal *b) { PanicGoal *s=b->context;s->holder->navMove(s->holder->host,s->target.x,s->target.y,s->target.z,s->speedMultiplier); }

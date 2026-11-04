// Batch 009: minecraftpe/impl/entity/ai/goals/RestrictSunGoal.cpp
U0 RestrictSunGoal_Init(RestrictSunGoal *s,MCGoalContext009 *h) { Goal_Init(&s->base);s->base.context=s;s->base.canUseFn=&RestrictSunGoal_canUse;s->base.startFn=&RestrictSunGoal_start;s->base.stopFn=&RestrictSunGoal_stop;s->holder=h; }
Bool RestrictSunGoal_canUse(Goal *b) { RestrictSunGoal *s=b->context;return s->holder->isDay(s->holder->world); }
U0 RestrictSunGoal_start(Goal *b) { RestrictSunGoal *s=b->context;s->holder->setAvoidSun(s->holder->host,TRUE); }
U0 RestrictSunGoal_stop(Goal *b) { RestrictSunGoal *s=b->context;s->holder->setAvoidSun(s->holder->host,FALSE); }

// Batch 009: minecraftpe/impl/entity/ai/goals/FloatGoal.cpp
U0 FloatGoal_Init(FloatGoal *self,MCGoalContext009 *h) { Goal_Init(&self->base);self->base.context=self;self->base.canUseFn=&FloatGoal_canUse;self->base.tickFn=&FloatGoal_tick;self->holder=h;Goal_setRequiredControlFlags(&self->base,4);h->setCanFloat(h->host,TRUE); }
Bool FloatGoal_canUse(Goal *b) { FloatGoal *s=b->context;return s->holder->inWater || s->holder->inLava; }
U0 FloatGoal_tick(Goal *b) { FloatGoal *s=b->context;if(Random_nextFloat(s->holder->random)<0.8)JumpControl_jump(s->holder->jump); }

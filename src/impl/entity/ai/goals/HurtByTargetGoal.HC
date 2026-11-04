// Inline original implementation from HurtByTargetGoal.hpp.
U0 HurtByTargetGoal_Init(HurtByTargetGoal *s,MCGoalHost012 *h,F32 radius){TargetGoal_Init(&s->base,h,radius,0);s->base.field_D=0;Goal_setRequiredControlFlags(&s->base.base,1);s->base.base.canUseFn=&HurtByTargetGoal_canUse;s->base.base.startFn=&HurtByTargetGoal_start;}
Bool HurtByTargetGoal_canUse(Goal *g){TargetGoal *s=g->context;return TargetGoal_canAttack(s,s->host->lastHurtBy(s->host->host),TRUE);}U0 HurtByTargetGoal_start(Goal *g){TargetGoal *s=g->context;MCGoalHost012 *h=s->host;h->setTarget(h->host,h->lastHurtBy(h->host));}

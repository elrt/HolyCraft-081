#ifndef MCPE_BATCH012_GOALS_SUPPORT
#define MCPE_BATCH012_GOALS_SUPPORT
class MCGoalEntity012 {U0 *identity;F32 minY,maxY;Bool alive,isPlayer,invulnerable;};
class MCGoalHost012 {U0 *host;Random *random;MCGoalEntity012 *self;MCGoalEntity012 *(*currentTarget)(U0 *);MCGoalEntity012 *(*lastHurtBy)(U0 *);MCGoalEntity012 *(*nearestPlayer)(U0 *,F32);U0 (*setTarget)(U0 *,MCGoalEntity012 *);Bool (*canSee)(U0 *,MCGoalEntity012 *);F32 (*distanceSqr)(U0 *,MCGoalEntity012 *);};
#endif

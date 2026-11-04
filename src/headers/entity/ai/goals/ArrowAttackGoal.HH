#ifndef MC020_ARROWATTACKGOAL
#define MC020_ARROWATTACKGOAL
class ArrowAttackGoal {Goal base;MCGoalHost020 *h;U0 *level;I32 targetId;Bool hasTarget;I32 attackTimeout,seenTicks,attackType,delayBetweenAttack;F32 speedMultiplier;};
U0 ArrowAttackGoal_Init(ArrowAttackGoal *s,MCGoalHost020 *h,F32 speed,I32 attackType,I32 delay);
U0 ArrowAttackGoal_setLevel(ArrowAttackGoal *s,U0 *level);
Bool ArrowAttackGoal_canUse(Goal *b);
Bool ArrowAttackGoal_canContinueToUse(Goal *b);
U0 ArrowAttackGoal_stop(Goal *b);
U0 ArrowAttackGoal_fireAtTarget(Goal *b);
U0 ArrowAttackGoal_tick(Goal *b);
U0 ArrowAttackGoal_Destroy(Goal *b);
#endif

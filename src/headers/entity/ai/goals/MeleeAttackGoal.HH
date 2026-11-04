#ifndef MC020_MELEEATTACKGOAL
#define MC020_MELEEATTACKGOAL
class MeleeAttackGoal {Goal base;MCGoalHost020 *h;U0 *level;I32 targetId;Bool hasTarget;I32 field_24,field_34;F32 speedMultiplier;Bool field_2C;U0 *path;};
U0 MeleeAttackGoal_Init(MeleeAttackGoal *s,MCGoalHost020 *h,F32 speed,Bool persistent);
U0 MeleeAttackGoal_setLevel(MeleeAttackGoal *s,U0 *level);
Bool MeleeAttackGoal_canUse(Goal *b);
Bool MeleeAttackGoal_canContinueToUse(Goal *b);
U0 MeleeAttackGoal_start(Goal *b);
U0 MeleeAttackGoal_stop(Goal *b);
U0 MeleeAttackGoal_Destroy(Goal *b);
U0 MeleeAttackGoal_tick(Goal *b);
#endif

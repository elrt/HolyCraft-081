class TargetGoal {Goal base;MCGoalHost012 *host;F32 radius;I8 checkVisibility,field_D,field_E,field_F;};
U0 TargetGoal_Init(TargetGoal *,MCGoalHost012 *,F32,I8);Bool TargetGoal_canAttack(TargetGoal *,MCGoalEntity012 *,Bool);Bool TargetGoal_canContinueToUse(Goal *);U0 TargetGoal_stop(Goal *);

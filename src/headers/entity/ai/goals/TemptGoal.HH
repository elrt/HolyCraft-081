#ifndef MC020_TEMPTGOAL
#define MC020_TEMPTGOAL
class TemptGoal {Goal base;MCGoalHost020 *h;U0 *level;I32 targetId;Bool hasTarget;F32 speedMultiplier,field_10,field_14,field_18,field_1C,field_20;I32 timeout,field_50;Bool running,field_4C,prevAvoidWater;MCVector followItemIds;};
U0 TemptGoal_Init(TemptGoal *s,MCGoalHost020 *h,F32 speed,I32 *ids,I64 count,Bool scare);
U0 TemptGoal_setLevel(TemptGoal *s,U0 *level);
Bool TemptGoal_isRunning(Goal *b);
Bool TemptGoal_canUse(Goal *b);
Bool TemptGoal_canContinueToUse(Goal *b);
U0 TemptGoal_start(Goal *b);
U0 TemptGoal_stop(Goal *b);
U0 TemptGoal_Destroy(Goal *b);
U0 TemptGoal_tick(Goal *b);
#endif

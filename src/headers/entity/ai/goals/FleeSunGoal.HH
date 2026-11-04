// Batch 009: minecraftpe/headers/entity/ai/goals/FleeSunGoal.hpp
class FleeSunGoal { Goal base; MCGoalContext009 *holder; Vec3 target; F32 speedMultiplier; U0 *level; };
U0 FleeSunGoal_Init(FleeSunGoal *s,MCGoalContext009 *h,F32 speed);Bool FleeSunGoal_getHidePos(FleeSunGoal *s,Vec3 *out);Bool FleeSunGoal_canUse(Goal *b);Bool FleeSunGoal_canContinueToUse(Goal *b);U0 FleeSunGoal_start(Goal *b);U0 FleeSunGoal_setLevel(FleeSunGoal *s,U0 *level);

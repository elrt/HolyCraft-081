// Batch 009: minecraftpe/headers/entity/ai/goals/PanicGoal.hpp
class PanicGoal { Goal base; MCGoalContext009 *holder; F32 speedMultiplier; Vec3 target; };
U0 PanicGoal_Init(PanicGoal *s,MCGoalContext009 *h,F32 speed);Bool PanicGoal_canUse(Goal *b);Bool PanicGoal_canContinueToUse(Goal *b);U0 PanicGoal_start(Goal *b);

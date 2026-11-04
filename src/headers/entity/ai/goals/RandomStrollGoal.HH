// Batch 009: minecraftpe/headers/entity/ai/goals/RandomStrollGoal.hpp
class RandomStrollGoal { Goal base; MCGoalContext009 *holder; Vec3 target; F32 speedMultiplier; };
U0 RandomStrollGoal_Init(RandomStrollGoal *s,MCGoalContext009 *h,F32 speed);Bool RandomStrollGoal_canUse(Goal *b);Bool RandomStrollGoal_canContinueToUse(Goal *b);U0 RandomStrollGoal_start(Goal *b);

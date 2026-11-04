// Batch 009: minecraftpe/headers/entity/ai/goals/RandomLookAroundGoal.hpp
class RandomLookAroundGoal { Goal base; MCGoalContext009 *holder; F32 xOff,zOff; I32 ticksLeft; };
U0 RandomLookAroundGoal_Init(RandomLookAroundGoal *self,MCGoalContext009 *holder);Bool RandomLookAroundGoal_canUse(Goal *b);Bool RandomLookAroundGoal_canContinueToUse(Goal *b);U0 RandomLookAroundGoal_start(Goal *b);U0 RandomLookAroundGoal_tick(Goal *b);

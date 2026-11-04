// Batch 009: minecraftpe/headers/entity/ai/goals/LookAtPlayerGoal.hpp
class LookAtPlayerGoal { Goal base; MCGoalContext009 *holder; I32 targetId; Bool hasTarget; F32 maxDistance; I32 ticksLeft; F32 startChance; };
U0 LookAtPlayerGoal_Init(LookAtPlayerGoal *s,MCGoalContext009 *h,F32 distance,F32 chance=0.02);Bool LookAtPlayerGoal_canUse(Goal *b);Bool LookAtPlayerGoal_canContinueToUse(Goal *b);U0 LookAtPlayerGoal_start(Goal *b);U0 LookAtPlayerGoal_stop(Goal *b);U0 LookAtPlayerGoal_tick(Goal *b);

// Batch 009: minecraftpe/headers/entity/ai/goals/SwellGoal.hpp
class SwellGoal { Goal base; MCGoalContext009 *holder; I32 targetId; Bool hasTarget; };
U0 SwellGoal_Init(SwellGoal *s,MCGoalContext009 *h);Bool SwellGoal_canUse(Goal *b);U0 SwellGoal_start(Goal *b);U0 SwellGoal_stop(Goal *b);U0 SwellGoal_tick(Goal *b);

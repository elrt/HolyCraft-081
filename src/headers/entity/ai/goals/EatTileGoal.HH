// Batch 009: minecraftpe/headers/entity/ai/goals/EatTileGoal.hpp
class EatTileGoal { Goal base; MCGoalContext009 *holder; U0 *level; I32 ticksLeft; };
U0 EatTileGoal_Init(EatTileGoal *s,MCGoalContext009 *h);Bool EatTileGoal_canUse(Goal *b);Bool EatTileGoal_canContinueToUse(Goal *b);U0 EatTileGoal_start(Goal *b);U0 EatTileGoal_stop(Goal *b);U0 EatTileGoal_tick(Goal *b);I32 EatTileGoal_getEatAnimationTick(EatTileGoal *s);U0 EatTileGoal_setLevel(EatTileGoal *s,U0 *level);

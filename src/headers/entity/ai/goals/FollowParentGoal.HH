// Batch 009: minecraftpe/headers/entity/ai/goals/FollowParentGoal.hpp
class FollowParentGoal { Goal base; MCGoalContext009 *holder; I32 parentId; Bool hasParent; F32 speedMultiplier; I32 ticksFollowing; };
U0 FollowParentGoal_Init(FollowParentGoal *s,MCGoalContext009 *h,F32 speed);Bool FollowParentGoal_canUse(Goal *b);Bool FollowParentGoal_canContinueToUse(Goal *b);U0 FollowParentGoal_start(Goal *b);U0 FollowParentGoal_stop(Goal *b);U0 FollowParentGoal_tick(Goal *b);

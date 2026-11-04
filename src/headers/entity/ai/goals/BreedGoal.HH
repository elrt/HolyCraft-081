#ifndef MC020_BREEDGOAL
#define MC020_BREEDGOAL
class BreedGoal {Goal base;MCGoalHost020 *h;U0 *level;I32 targetId;Bool hasTarget;I32 inUseTicks;F32 speedMultiplier;};
U0 BreedGoal_Init(BreedGoal *s,MCGoalHost020 *h,F32 speed);
U0 BreedGoal_setLevel(BreedGoal *s,U0 *level);
MCActor020 * BreedGoal_getFreePartner(Goal *b);
Bool BreedGoal_canUse(Goal *b);
Bool BreedGoal_canContinueToUse(Goal *b);
U0 BreedGoal_stop(Goal *b);
U0 BreedGoal_breed(Goal *b);
U0 BreedGoal_tick(Goal *b);
U0 BreedGoal_Destroy(Goal *b);
#endif

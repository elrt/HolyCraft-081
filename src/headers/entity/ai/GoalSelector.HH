// Batch 004. Source: minecraftpe/headers/entity/ai/GoalSelector.hpp
#ifndef MCPE_HEADERS_ENTITY_AI_GOALSELECTOR_HPP
#define MCPE_HEADERS_ENTITY_AI_GOALSELECTOR_HPP
class InternalGoal { Goal *goal; I32 field_4; Bool field_8; I8 field_9,field_A,field_B; };
class GoalSelector { MCPtrVector internalGoals,runningGoals,field_18; };
U0 GoalSelector_Init(GoalSelector *self);
U0 InternalGoal_Init(InternalGoal *self,I32 priority,Goal *goal,Bool owns);
U0 GoalSelector_addGoal(GoalSelector *self,I32 priority,Goal *goal,Bool owns);
Bool GoalSelector_canCoExist(GoalSelector *self,InternalGoal *a2,InternalGoal *a3);
Bool GoalSelector_canUseInSystem(GoalSelector *self,InternalGoal *candidate);
MCPtrVector *GoalSelector_getRunningGoals(GoalSelector *self);
U0 GoalSelector_tick(GoalSelector *self);
U0 GoalSelector_Destroy(GoalSelector *self);

#endif


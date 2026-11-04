// Batch 004. Source: minecraftpe/headers/entity/ai/Goal.hpp
#ifndef MCPE_HEADERS_ENTITY_AI_GOAL_HPP
#define MCPE_HEADERS_ENTITY_AI_GOAL_HPP
class Goal { I32 controlFlags; U0 *context; Bool (*canUseFn)(Goal *self); Bool (*continueFn)(Goal *self); Bool (*interruptFn)(Goal *self); U0 (*startFn)(Goal *self); U0 (*stopFn)(Goal *self); U0 (*tickFn)(Goal *self); U0 (*destroyFn)(Goal *self); };
U0 Goal_Init(Goal *self);
Bool Goal_canUse(Goal *self);
Bool Goal_canContinueToUse(Goal *self);
Bool Goal_canInterrupt(Goal *self);
U0 Goal_start(Goal *self); U0 Goal_stop(Goal *self); U0 Goal_tick(Goal *self);
U0 Goal_Destroy(Goal *self);
U0 Goal_setRequiredControlFlags(Goal *self,I32 flags);
I32 Goal_getRequiredControlFlags(Goal *self);

#endif


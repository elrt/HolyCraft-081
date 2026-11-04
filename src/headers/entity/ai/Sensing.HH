// Batch 004. Source: minecraftpe/headers/entity/ai/Sensing.hpp
#ifndef MCPE_HEADERS_ENTITY_AI_SENSING_HPP
#define MCPE_HEADERS_ENTITY_AI_SENSING_HPP
class Sensing { U0 *holder; Bool (*canSeeFn)(U0 *holder,U0 *entity); MCVector _canSee,_cannotSee; };
U0 Sensing_Init(Sensing *self,U0 *holder,Bool (*canSeeFn)(U0 *holder,U0 *entity)) { self->holder=holder;self->canSeeFn=canSeeFn;MCVector_Init(&self->_canSee,sizeof(I32));MCVector_Init(&self->_cannotSee,sizeof(I32)); }
Bool Sensing_canSee(Sensing *self,U0 *entity,I32 entityId) { I64 i;I32 *id;for(i=0;i<self->_canSee.size;i++) { id=MCVector_At(&self->_canSee,i);if(*id==entityId)return TRUE; }for(i=0;i<self->_cannotSee.size;i++) { id=MCVector_At(&self->_cannotSee,i);if(*id==entityId)return FALSE; }if(!self->canSeeFn)exit(85);Bool r=self->canSeeFn(self->holder,entity);if(r)MCVector_Push(&self->_canSee,&entityId);else MCVector_Push(&self->_cannotSee,&entityId);return r; }
U0 Sensing_Destroy(Sensing *self) { MCVector_Destroy(&self->_canSee);MCVector_Destroy(&self->_cannotSee); }

#endif


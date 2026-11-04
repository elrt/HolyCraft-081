// Batch 004. Source: minecraftpe/headers/util/TempEPtr.hpp
#ifndef MCPE_HEADERS_UTIL_TEMPEPTR_HPP
#define MCPE_HEADERS_UTIL_TEMPEPTR_HPP
class TempEPtr { U0 *entity; I32 entityId; U0 *level; Bool locked; U0 *(*getEntity)(U0 *level,I32 entityId); U0 (*unregisterPointer)(U0 *level,TempEPtr *pointer); };
U0 TempEPtr_Init(TempEPtr *self) { memset(self,0,sizeof(TempEPtr)); }
U0 *TempEPtr_lock(TempEPtr *self) { if(!self->locked) { if(self->level && self->entityId>0) { if(!self->getEntity)exit(85);self->entity=self->getEntity(self->level,self->entityId);if(!self->entity)self->entity=self->getEntity(self->level,self->entityId); }self->locked=TRUE; }return self->entity; }
U0 TempEPtr_unset(TempEPtr *self) { self->entity=NULL;self->entityId=0;self->locked=FALSE;if(self->level) { if(!self->unregisterPointer)exit(85);self->unregisterPointer(self->level,self); }self->level=NULL; }
U0 TempEPtr_invalidate(TempEPtr *self) { self->entity=NULL;self->locked=FALSE; }
U0 TempEPtr_Destroy(TempEPtr *self) { TempEPtr_unset(self); }

#endif


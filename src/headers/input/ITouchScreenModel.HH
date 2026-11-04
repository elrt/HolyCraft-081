// Batch 002. Source: minecraftpe/headers/input/ITouchScreenModel.hpp
#ifndef MCPE_HEADERS_INPUT_ITOUCHSCREENMODEL_HPP
#define MCPE_HEADERS_INPUT_ITOUCHSCREENMODEL_HPP
class ITouchScreenModel {
 I32 (*eventFn)(ITouchScreenModel *self,MouseAction *event);
 I32 (*positionFn)(ITouchScreenModel *self,I32 x,I32 y,I32 pointer);
 U0 (*destroyFn)(ITouchScreenModel *self);
};
I32 ITouchScreenModel_DefaultEvent(ITouchScreenModel *self,MouseAction *event) { return event->field_A(U8); }
I32 ITouchScreenModel_DefaultPosition(ITouchScreenModel *self,I32 x,I32 y,I32 pointer) { return pointer; }
U0 ITouchScreenModel_Init(ITouchScreenModel *self) { self->eventFn=&ITouchScreenModel_DefaultEvent; self->positionFn=&ITouchScreenModel_DefaultPosition; self->destroyFn=NULL; }
I32 ITouchScreenModel_getPointerIdEvent(ITouchScreenModel *self,MouseAction *event) { return self->eventFn(self,event); }
I32 ITouchScreenModel_getPointerIdPosition(ITouchScreenModel *self,I32 x,I32 y,I32 pointer) { return self->positionFn(self,x,y,pointer); }
U0 ITouchScreenModel_Destroy(ITouchScreenModel *self) { if(self->destroyFn) self->destroyFn(self); }

#endif


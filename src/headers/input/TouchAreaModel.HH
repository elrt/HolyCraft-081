// Batch 002. Source: minecraftpe/headers/input/TouchAreaModel.hpp
#ifndef MCPE_HEADERS_INPUT_TOUCHAREAMODEL_HPP
#define MCPE_HEADERS_INPUT_TOUCHAREAMODEL_HPP
class TouchAreaModelArea { IArea *area; I32 field_4; };
class TouchAreaModel : ITouchScreenModel { MCPtrVector areas; };
I32 TouchAreaModel_Position(ITouchScreenModel *base,I32 x,I32 y,I32 pointer) {
 TouchAreaModel *self=base; I64 i; F32 fx=x,fy=y;
 for(i=0;i<self->areas.size;i++) { TouchAreaModelArea *entry=self->areas.data[i]; if(IArea_isInside(entry->area,fx,fy)) return entry->field_4; }
 return pointer;
}
I32 TouchAreaModel_Event(ITouchScreenModel *base,MouseAction *event) { return TouchAreaModel_Position(base,event->field_0,event->field_2,event->field_A(U8)); }
U0 TouchAreaModel_clear(TouchAreaModel *self) {
 I64 i; for(i=0;i<self->areas.size;i++) {
  TouchAreaModelArea *entry=self->areas.data[i]; if(entry->area && entry->area->field_4) { IArea_Destroy(entry->area); free(entry->area); } free(entry);
 } self->areas.size=0;
}
U0 TouchAreaModel_DestroyDispatch(ITouchScreenModel *base) { TouchAreaModel *self=base; TouchAreaModel_clear(self); MCPtrVector_Destroy(&self->areas); }
U0 TouchAreaModel_Init(TouchAreaModel *self) {
 ITouchScreenModel_Init(self); self->eventFn=&TouchAreaModel_Event; self->positionFn=&TouchAreaModel_Position; self->destroyFn=&TouchAreaModel_DestroyDispatch; MCPtrVector_Init(&self->areas);
}
U0 TouchAreaModel_addArea(TouchAreaModel *self,I32 pointer,IArea *area) {
 TouchAreaModelArea *entry=MC_Alloc(sizeof(TouchAreaModelArea)); entry->area=area; entry->field_4=pointer; MCPtrVector_Push(&self->areas,entry);
}

#endif


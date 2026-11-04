// Batch 002. Source: minecraftpe/headers/util/area/IncludeExcludeArea.hpp
#ifndef MCPE_HEADERS_UTIL_AREA_INCLUDEEXCLUDEAREA_HPP
#define MCPE_HEADERS_UTIL_AREA_INCLUDEEXCLUDEAREA_HPP
class IncludeExcludeArea : IArea { MCPtrVector includeAreas,excludeAreas; };
Bool IncludeExcludeArea_Inside(IArea *base,F32 x,F32 y) {
 IncludeExcludeArea *self=base; I64 i,j; Bool excluded;
 for(i=0;i<self->includeAreas.size;i++) if(IArea_isInside(self->includeAreas.data[i],x,y)) {
  excluded=FALSE; for(j=0;j<self->excludeAreas.size;j++) if(IArea_isInside(self->excludeAreas.data[j],x,y)) { excluded=TRUE; break; }
  if(!excluded) return TRUE;
 } return FALSE;
}
U0 IncludeExcludeArea_clear(IncludeExcludeArea *self) {
 I64 i; IArea *area;
 if(self->field_4) {
  for(i=0;i<self->includeAreas.size;i++) { area=self->includeAreas.data[i]; if(area->field_4) { IArea_Destroy(area); free(area); } }
  for(i=0;i<self->excludeAreas.size;i++) { area=self->excludeAreas.data[i]; if(area->field_4) { IArea_Destroy(area); free(area); } }
 } self->includeAreas.size=0; self->excludeAreas.size=0;
}
U0 IncludeExcludeArea_DestroyDispatch(IArea *base) { IncludeExcludeArea *self=base; IncludeExcludeArea_clear(self); MCPtrVector_Destroy(&self->includeAreas); MCPtrVector_Destroy(&self->excludeAreas); }
U0 IncludeExcludeArea_Init(IncludeExcludeArea *self,Bool owns) {
 self->field_4=owns; self->insideFn=&IncludeExcludeArea_Inside; self->destroyFn=&IncludeExcludeArea_DestroyDispatch;
 MCPtrVector_Init(&self->includeAreas); MCPtrVector_Init(&self->excludeAreas);
}

#endif


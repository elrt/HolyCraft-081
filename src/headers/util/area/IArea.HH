// Port batch 001. Upstream: minecraftpe/headers/util/area/IArea.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_UTIL_AREA_IAREA_HPP
#define MCPE_HEADERS_UTIL_AREA_IAREA_HPP
class IArea {
 Bool field_4; I8 field_5,field_6,field_7;
 Bool (*insideFn)(IArea *self,F32 x,F32 y); U0 (*destroyFn)(IArea *self);
};
Bool IArea_isInside(IArea *self,F32 x,F32 y) { return self->insideFn(self,x,y); }
U0 IArea_Destroy(IArea *self) { if(self->destroyFn) self->destroyFn(self); }
#endif


// Port batch 001. Upstream: minecraftpe/headers/util/area/RectangleArea.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_UTIL_AREA_RECTANGLEAREA_HPP
#define MCPE_HEADERS_UTIL_AREA_RECTANGLEAREA_HPP
class RectangleArea : IArea { F32 minX,maxX,minY,maxY; };
Bool RectangleArea_InsideDispatch(IArea *base,F32 x,F32 y) {
 RectangleArea *self=base; return x>=self->minX && x<=self->maxX && y>=self->minY && y<=self->maxY;
}
U0 RectangleArea_Init(RectangleArea *self,Bool flag,F32 minX,F32 minY,F32 maxX,F32 maxY) {
 self->field_4=flag; self->minX=minX; self->minY=minY; self->maxX=maxX; self->maxY=maxY;
 self->insideFn=&RectangleArea_InsideDispatch; self->destroyFn=NULL;
}
F32 RectangleArea_centerX(RectangleArea *self) { return self->minX+(self->maxX-self->minX)*0.5; }
F32 RectangleArea_centerY(RectangleArea *self) { return self->minY+(self->maxY-self->minY)*0.5; }
Bool RectangleArea_isInside(RectangleArea *self,F32 x,F32 y) { return RectangleArea_InsideDispatch(self,x,y); }
#endif


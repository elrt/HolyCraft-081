// Port batch 001. Upstream: minecraftpe/headers/util/IntRectangle.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_UTIL_INTRECTANGLE_HPP
#define MCPE_HEADERS_UTIL_INTRECTANGLE_HPP
class IntRectangle { I32 minX,minY,width,height; };
U0 IntRectangle_Init(IntRectangle *self,I32 x,I32 y,I32 w,I32 h) {
 self->minX=x; self->minY=y; self->width=w; self->height=h;
}
#endif


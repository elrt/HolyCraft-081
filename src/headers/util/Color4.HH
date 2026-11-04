// Port batch 001. Upstream: minecraftpe/headers/util/Color4.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_UTIL_COLOR4_HPP
#define MCPE_HEADERS_UTIL_COLOR4_HPP
class Color4 { F32 r,g,b,a; };
U0 Color4_Init(Color4 *self,F32 r,F32 g,F32 b,F32 a) { self->r=r; self->g=g; self->b=b; self->a=a; }
F32 Color4_min2(F32 x,F32 y) { if(y<x) return y; return x; }
F32 Color4_max2(F32 x,F32 y) { if(x<y) return y; return x; }
I32 Color4_toARGB(Color4 *self) {
 I32 ret; U8 *bytes=&ret; bytes[0]=(self->r*255.0)(U32); bytes[1]=(self->g*255.0)(U32);
 bytes[2]=(self->b*255.0)(U32); bytes[3]=(self->a*255.0)(U32); return ret;
}
U0 Color4_lerp(Color4 *a,Color4 *b,F32 f,Color4 *out) {
 Color4_Init(out,f*b->r+(1.0-f)*a->r,f*b->g+(1.0-f)*a->g,f*b->b+(1.0-f)*a->b,f*b->a+(1.0-f)*a->a);
}
U0 Color4_fromHSB(F32 h,F32 s,F32 b,Color4 *out);
U0 Color4_clamp(Color4 *self) {
 self->r=Color4_max2(0,Color4_min2(self->r,1)); self->g=Color4_max2(0,Color4_min2(self->g,1));
 self->b=Color4_max2(0,Color4_min2(self->b,1)); self->a=Color4_max2(0,Color4_min2(self->a,1));
}
#endif


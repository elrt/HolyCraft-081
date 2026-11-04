// Port batch 001. Upstream: minecraftpe/headers/rendering/VertexPT.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_RENDERING_VERTEXPT_HPP
#define MCPE_HEADERS_RENDERING_VERTEXPT_HPP
class VertexPT { Vec3 vec; F32 u,v; };
U0 VertexPT_Init(VertexPT *self) { Vec3_Init(&self->vec); }
U0 VertexPT_InitUV(VertexPT *self,VertexPT *other,F32 u,F32 v) {
 Vec3_Copy(&self->vec,&other->vec); self->u=u; self->v=v;
}
#endif


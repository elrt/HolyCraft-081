// Batch 005. Source: minecraftpe/headers/rendering/PolygonQuad.hpp
#ifndef MCPE_HEADERS_RENDERING_POLYGONQUAD_HPP
#define MCPE_HEADERS_RENDERING_POLYGONQUAD_HPP
class PolygonQuad { VertexPT verticies[4]; Bool flipnormal; I8 align1,align2,align3; };
U0 PolygonQuad_Init(PolygonQuad *self,VertexPT *v1,VertexPT *v2,VertexPT *v3,VertexPT *v4);
U0 PolygonQuad_InitUV(PolygonQuad *self,VertexPT *v1,VertexPT *v2,VertexPT *v3,VertexPT *v4,F32 a,F32 b,F32 c,F32 d);
U0 PolygonQuad_InitPixels(PolygonQuad *self,VertexPT *v1,VertexPT *v2,VertexPT *v3,VertexPT *v4,I32 a,I32 b,I32 c,I32 d,I32 tw,I32 th);
U0 PolygonQuad_mirror(PolygonQuad *self); U0 PolygonQuad_flipNormal(PolygonQuad *self);
U0 PolygonQuad_render(PolygonQuad *self,MCVertexSink *sink,F32 scale,I32 color);

#endif


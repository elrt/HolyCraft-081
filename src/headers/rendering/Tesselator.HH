// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class Tesselator {MCVector vertices,indices;MCGeometry024 *host;F32 u,v,offsetX,offsetY,offsetZ,scale1,scale2,scale3;U32 color;I8 nx,ny,nz;I32 mode;Bool drawing,noColor;};

U0 Tesselator_Init(Tesselator *s,MCGeometry024 *host);
U0 Tesselator_Destroy(Tesselator *s);
U0 Tesselator_begin(Tesselator *s,I32 mode);
I32 MC024_ColorClamp(I32 v);
U0 Tesselator_color(Tesselator *s,I32 r,I32 g,I32 b,I32 a);
U0 Tesselator_normal(Tesselator *s,F32 x,F32 y,F32 z);
U0 Tesselator_offset(Tesselator *s,F32 x,F32 y,F32 z);
Bool Tesselator_vertex(Tesselator *s,F32 x,F32 y,F32 z);
Bool Tesselator_vertexUV(Tesselator *s,F32 x,F32 y,F32 z,F32 u,F32 v);
U0 Tesselator_quad(Tesselator *s,I32 base,Bool reverse);
U0 Tesselator_end(Tesselator *s);
U0 Tesselator_draw(Tesselator *s);

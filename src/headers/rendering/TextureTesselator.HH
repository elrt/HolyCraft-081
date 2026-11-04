// Batch026 partial source API; not original C++ ABI.
class TextureTesselator {I32 texXMin,texYMin,texXMax,texYMax;Vec3 light;Color4 ambient,tint;TextureData *texture;Bool lit;};
U0 TextureTesselator_Init(TextureTesselator *s,TextureData *texture,I32 x,I32 y,I32 xx,I32 yy,Vec3 *light,Color4 *ambient,Color4 *tint);
F32 MC026_Clamp01(F32 v);
U0 TextureTesselator_addLighting(TextureTesselator *s,Tesselator *t,F32 nx,F32 ny,F32 nz,U8 *pixel,I32 x,I32 y);
U0 MC026_Quad(Tesselator *t,F32 x,F32 y,F32 z,F32 xx,F32 yy,F32 zz,I32 axis,Bool reverse);
Bool TextureTesselator_tesselate(TextureTesselator *s,Tesselator *t);

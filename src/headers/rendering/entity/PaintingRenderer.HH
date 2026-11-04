#ifndef MC020_PAINTINGRENDERER
#define MC020_PAINTINGRENDERER
class MCPaintMesh020 {U0 *motive,*handle;};
class PaintingRenderer {MCG020 *g;MCVector motives;};
U0 PaintingRenderer_Init(PaintingRenderer *s,MCG020 *g);
U0 PaintingRenderer_onAppSuspended(PaintingRenderer *s);
U0 PaintingRenderer_Destroy(PaintingRenderer *s);
U0 * PaintingRenderer_buildPainting(PaintingRenderer *s,I32 a2,I32 a3,I32 a4,I32 a5);
U0 * PaintingRenderer_getMesh(PaintingRenderer *s,MCRenderEntity020 *e);
U0 PaintingRenderer_render(PaintingRenderer *s,MCRenderEntity020 *e,F32 x,F32 y,F32 z,F32 angle,F32 t);
#endif

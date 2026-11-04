#ifndef MC020_ARROWRENDERER
#define MC020_ARROWRENDERER
class ArrowRenderer {MCG020 *g;MCMesh020 mesh;};
U0 ArrowRenderer_Init(ArrowRenderer *s,MCG020 *g);
U0 ArrowRenderer_onAppSuspended(ArrowRenderer *s);
U0 ArrowRenderer_Destroy(ArrowRenderer *s);
U0 ArrowRenderer_render(ArrowRenderer *s,MCRenderEntity020 *e,F32 x,F32 y,F32 z,F32 angle,F32 t);
#endif

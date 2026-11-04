#ifndef MC020_SIGNRENDERER
#define MC020_SIGNRENDERER
class SignRenderer {MCG020 *g;U0 *model;};
U0 SignRenderer_Init(SignRenderer *s,MCG020 *g);
U0 SignRenderer_render(SignRenderer *s,MCRenderTile020 *e,F32 x,F32 y,F32 z,F32 t,Bool fancy);
U0 SignRenderer_Destroy(SignRenderer *s);
#endif

#ifndef MC020_CHESTRENDERER
#define MC020_CHESTRENDERER
class ChestRenderer {MCG020 *g;U0 *single,*paired;};
U0 ChestRenderer_Init(ChestRenderer *s,MCG020 *g);
U0 ChestRenderer_render(ChestRenderer *s,MCRenderTile020 *e,F32 x,F32 y,F32 z,F32 t,Bool fancy);
U0 ChestRenderer_Destroy(ChestRenderer *s);
#endif

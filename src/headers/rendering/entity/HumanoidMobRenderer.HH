#ifndef MC020_HUMANOIDMOBRENDERER
#define MC020_HUMANOIDMOBRENDERER
class HumanoidMobRenderer {MCG020 *g;U0 *hmodel;F32 shadow;};
U0 HumanoidMobRenderer_Init(HumanoidMobRenderer *s,MCG020 *g,U0 *model,F32 shadow);
U0 HumanoidMobRenderer_renderHand(HumanoidMobRenderer *s);
U0 HumanoidMobRenderer_render(HumanoidMobRenderer *s,MCRenderEntity020 *e,F32 x,F32 y,F32 z,F32 angle,F32 t);
U0 HumanoidMobRenderer_additionalRendering(HumanoidMobRenderer *s,MCRenderEntity020 *e,F32 t);
U0 HumanoidMobRenderer_Destroy(HumanoidMobRenderer *s);
#endif

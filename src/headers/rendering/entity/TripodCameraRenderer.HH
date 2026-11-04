#ifndef MC020_TRIPODCAMERARENDERER
#define MC020_TRIPODCAMERARENDERER
class TripodCameraRenderer {MCG020 *g;U0 *model;};
U0 TripodCameraRenderer_Init(TripodCameraRenderer *s,MCG020 *g);
F32 TripodCameraRenderer_getFlashTime(MCRenderEntity020 *e,F32 t);
U0 TripodCameraRenderer_render(TripodCameraRenderer *s,MCRenderEntity020 *e,F32 x,F32 y,F32 z,F32 angle,F32 t);
U0 TripodCameraRenderer_Destroy(TripodCameraRenderer *s);
#endif

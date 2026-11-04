#ifndef MC020_TILEENTITYRENDERDISPATCHER
#define MC020_TILEENTITYRENDERDISPATCHER
class TileEntityRenderDispatcher {MCDispatchHost020 *h;U0 *textures,*level,*minecraft,*font;MCRenderEntity020 *camera;MCRenderer020 *renderers[3];F32 camYaw,camPitch,camX,camY,camZ,xOff,yOff,zOff;Bool fancy;};
U0 TileEntityRenderDispatcher_Init(TileEntityRenderDispatcher *s,MCDispatchHost020 *h);
U0 TileEntityRenderDispatcher_Destroy(TileEntityRenderDispatcher *s);
U0 TileEntityRenderDispatcher_destroy();
U0 * TileEntityRenderDispatcher_getInstance(MCDispatchHost020 *h);
F32 TileEntityRenderDispatcher_distanceToSqr(TileEntityRenderDispatcher *s,F32 x,F32 y,F32 z);
U0 * TileEntityRenderDispatcher_getFont(TileEntityRenderDispatcher *s);
MCRenderer020 * TileEntityRenderDispatcher_getRendererId(TileEntityRenderDispatcher *s,I32 id);
MCRenderer020 * TileEntityRenderDispatcher_getRenderer(TileEntityRenderDispatcher *s,MCRenderTile020 *e);
U0 TileEntityRenderDispatcher_setLevel(TileEntityRenderDispatcher *s,U0 *level);
U0 TileEntityRenderDispatcher_prepare(TileEntityRenderDispatcher *s,U0 *level,U0 *textures,U0 *font,MCRenderEntity020 *camera,F32 t);
U0 TileEntityRenderDispatcher_renderAt(TileEntityRenderDispatcher *s,MCRenderTile020 *e,F32 x,F32 y,F32 z,F32 t);
U0 TileEntityRenderDispatcher_render(TileEntityRenderDispatcher *s,MCRenderTile020 *e,F32 t);
#endif

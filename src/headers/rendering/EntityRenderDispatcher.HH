#ifndef MC020_ENTITYRENDERDISPATCHER
#define MC020_ENTITYRENDERDISPATCHER
class EntityRenderDispatcher {MCDispatchHost020 *h;U0 *level,*minecraft,*options,*font;MCRenderEntity020 *camera;MCRenderer020 *renderers[22];F32 cameraYaw,cameraPitch,camX,camY,camZ,xOff,yOff,zOff;};
U0 EntityRenderDispatcher_assign(EntityRenderDispatcher *s,I32 id,MCRenderer020 *r);
U0 EntityRenderDispatcher_Init(EntityRenderDispatcher *s,MCDispatchHost020 *h);
U0 EntityRenderDispatcher_Destroy(EntityRenderDispatcher *s);
U0 EntityRenderDispatcher_destroy();
U0 * EntityRenderDispatcher_getInstance(MCDispatchHost020 *h);
F32 EntityRenderDispatcher_distanceToSqr(EntityRenderDispatcher *s,F32 x,F32 y,F32 z);
U0 * EntityRenderDispatcher_getFont(EntityRenderDispatcher *s);
MCRenderer020 * EntityRenderDispatcher_getRendererId(EntityRenderDispatcher *s,I32 id);
MCRenderer020 * EntityRenderDispatcher_getRenderer(EntityRenderDispatcher *s,MCRenderEntity020 *e);
U0 EntityRenderDispatcher_prepare(EntityRenderDispatcher *s,U0 *level,U0 *font,MCRenderEntity020 *camera,U0 *options,F32 t);
U0 EntityRenderDispatcher_renderAt(EntityRenderDispatcher *s,MCRenderEntity020 *e,F32 x,F32 y,F32 z,F32 angle,F32 t);
U0 EntityRenderDispatcher_render(EntityRenderDispatcher *s,MCRenderEntity020 *e,F32 t);
U0 EntityRenderDispatcher_setLevel(EntityRenderDispatcher *s,U0 *level);
U0 EntityRenderDispatcher_setMinecraft(EntityRenderDispatcher *s,U0 *minecraft);
#endif

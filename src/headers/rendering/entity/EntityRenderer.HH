#ifndef MC020_ENTITYRENDERER
#define MC020_ENTITYRENDERER
class EntityRenderer {MCG020 *g;Bool fancy;U0 *dispatcher;};
U0 EntityRenderer_Init(EntityRenderer *s,MCG020 *g,U0 *dispatcher,Bool fancy);
U0 EntityRenderer_bindTexture(EntityRenderer *s,MCString *name);
U0 * EntityRenderer_getFont(EntityRenderer *s);
Bool EntityRenderer_isFancy(EntityRenderer *s);
U0 EntityRenderer_renderFlat(MCG020 *g,AABB *bb);
U0 EntityRenderer_renderBox(MCG020 *g,AABB *bb,F32 x,F32 y,F32 z);
U0 EntityRenderer_renderFlame(EntityRenderer *s,MCRenderEntity020 *e,F32 x,F32 y,F32 z,F32 t);
U0 EntityRenderer_postRender(EntityRenderer *s,MCRenderEntity020 *e,F32 x,F32 y,F32 z,F32 angle,F32 t);
U0 EntityRenderer_renderName(EntityRenderer *s,MCRenderEntity020 *e,F32 t);
U0 EntityRenderer_Destroy(EntityRenderer *s);
#endif

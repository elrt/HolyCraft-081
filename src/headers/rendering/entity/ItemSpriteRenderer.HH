#ifndef MC020_ITEMSPRITERENDERER
#define MC020_ITEMSPRITERENDERER
class ItemSpriteRenderer {MCG020 *g;MCMesh020 mesh;MCString textureFile;MCItem020 *item;F32 cameraYaw,cameraPitch;};
U0 ItemSpriteRenderer_Init(ItemSpriteRenderer *s,MCG020 *g,MCItem020 *item);
U0 ItemSpriteRenderer_onAppSuspended(ItemSpriteRenderer *s);
U0 ItemSpriteRenderer_Destroy(ItemSpriteRenderer *s);
U0 ItemSpriteRenderer_render(ItemSpriteRenderer *s,MCRenderEntity020 *e,F32 x,F32 y,F32 z,F32 angle,F32 t);
#endif

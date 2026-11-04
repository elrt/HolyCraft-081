// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class ItemInHandRenderer {ItemInstance item;F32 equip,previousEquip;Tesselator *tesselator;};

U0 ItemInHandRenderer_Init(ItemInHandRenderer *s,MCRegistry023 *r,Tesselator *t);
U0 ItemInHandRenderer_tick(ItemInHandRenderer *s,ItemInstance *selected);
U0 ItemInHandRenderer_itemPlaced(ItemInHandRenderer *s);
U0 ItemInHandRenderer_itemUsed(ItemInHandRenderer *s);
I32 ItemInHandRenderer_getFrameID(ItemInstance *item,I32 entityType,I32 animationFrame);
U0 ItemInHandRenderer_renderTex(ItemInHandRenderer *s,TextureUVCoordinateSet *uv);
U0 ItemInHandRenderer_renderWater(ItemInHandRenderer *s,F32 yaw,F32 pitch,F32 brightness);
F32 ItemInHandRenderer_getEquip(ItemInHandRenderer *s,F32 partial);

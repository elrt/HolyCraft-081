// Batch 009: minecraftpe/impl/item/LeafTileItem.cpp includes the header only.
U0 LeafTileItem_Init(LeafTileItem *s,MCItemContext009 *c,MCPlaceContext009 *p,I32 id) { TileItem_Init(&s->base,c,p,id);s->base.base.maxDamage=0;s->base.base.stackedByData=TRUE;s->base.levelData=&LeafTileItem_getLevelDataForAuxValue;s->base.levelDataSelf=s; }
TextureUVCoordinateSet *LeafTileItem_getIcon(LeafTileItem *s,I32 aux,I32 unused,Bool use) { MCPlaceContext009 *p=s->base.place;return p->texture(p->host,p->leaves,0,aux,FALSE); }
I32 LeafTileItem_getLevelDataForAuxValue(U0 *s,I32 aux) { return aux|8; }

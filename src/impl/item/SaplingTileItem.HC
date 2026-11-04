// Batch 009: minecraftpe/impl/item/SaplingTileItem.cpp includes the header only.
U0 SaplingTileItem_Init(SaplingTileItem *s,MCItemContext009 *c,MCPlaceContext009 *p,I32 id) { TileItem_Init(&s->base,c,p,id);s->base.base.maxDamage=0;s->base.base.stackedByData=TRUE;s->base.levelData=&SaplingTileItem_getLevelDataForAuxValue;s->base.levelDataSelf=s; }
TextureUVCoordinateSet *SaplingTileItem_getIcon(SaplingTileItem *s,I32 aux,I32 unused,Bool use) { MCPlaceContext009 *p=s->base.place;return p->texture(p->host,p->sapling,0,aux,FALSE); }
I32 SaplingTileItem_getLevelDataForAuxValue(U0 *s,I32 aux) { return aux; }

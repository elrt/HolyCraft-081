// Batch 009: minecraftpe/impl/item/HatchetItem.cpp
U0 HatchetItem_Init(HatchetItem *s,MCItemContext009 *c,I32 id,MCToolTier009 *tier,MCToolTiles009 *t) { MCToolTile009 *a[6];DiggerItem_Init(&s->base,c,id,3,tier,NULL,0);s->tiles=t;a[0]=t->wood;a[1]=t->bookshelf;a[2]=t->treeTrunk;a[3]=t->chest;a[4]=t->woodSlab;a[5]=t->woodSlabHalf;DiggerItem_setTiles(&s->base,a,6); }
F32 HatchetItem_getDestroySpeed(HatchetItem *s,MCToolTile009 *tile) { if(tile && tile->material==s->tiles->woodMaterial)return s->base.efficiencyMultiplier;return DiggerItem_getDestroySpeed(&s->base,tile); }

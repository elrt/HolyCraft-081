// Batch 009: minecraftpe/impl/item/ShovelItem.cpp
U0 ShovelItem_Init(ShovelItem *s,MCItemContext009 *c,I32 id,MCToolTier009 *tier,MCToolTiles009 *t) { MCToolTile009 *a[8];DiggerItem_Init(&s->base,c,id,1,tier,NULL,0);s->tiles=t;a[0]=t->grass;a[1]=t->dirt;a[2]=t->sand;a[3]=t->gravel;a[4]=t->topSnow;a[5]=t->snow;a[6]=t->clay;a[7]=t->farmland;DiggerItem_setTiles(&s->base,a,8); }
Bool ShovelItem_canDestroySpecial(ShovelItem *s,MCToolTile009 *tile) { return tile==s->tiles->topSnow || tile==s->tiles->snow; }

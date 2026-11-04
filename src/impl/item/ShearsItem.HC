// Batch 009: minecraftpe/impl/item/ShearsItem.cpp includes the header only.
U0 ShearsItem_Init(ShearsItem *s,MCItemContext009 *c,I32 id,MCToolTiles009 *t) { MCItem009_Init(&s->base,c,id);s->base.maxStackSize=1;s->base.maxDamage=238;s->tiles=t; }
F32 ShearsItem_getDestroySpeed(ShearsItem *s,MCToolTile009 *tile) { I32 id=tile->id;if(id==s->tiles->web->id || id==s->tiles->leaves->id)return 15.0;if(id==s->tiles->cloth->id)return 5.0;return 1.0; }
Bool ShearsItem_canDestroySpecial(ShearsItem *s,MCToolTile009 *tile) { return tile->id==s->tiles->web->id; }
Bool ShearsItem_mineBlock(ShearsItem *s,MCItemContext009 *c,MCPacketItem009 *item,I32 id) { if(id!=s->tiles->leaves->id && id!=s->tiles->web->id)return FALSE;c->hurtAndBreak(c->host,item,1);return TRUE; }

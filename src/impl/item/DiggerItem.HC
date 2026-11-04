// Batch 009: minecraftpe/impl/item/DiggerItem.cpp
U0 DiggerItem_Init(DiggerItem *s,MCItemContext009 *c,I32 id,I32 damage,MCToolTier009 *tier,MCToolTile009 **tiles,I32 count) { MCItem009_Init(&s->base,c,id);s->tier=tier;s->efficiencyMultiplier=tier->efficiencyMultiplier;MCPtrVector_Init(&s->field_50);DiggerItem_setTiles(s,tiles,count);s->base.maxStackSize=1;s->base.maxDamage=tier->durability;s->damageAgainstEntity=tier->damageAgainstEntity+damage; }
U0 DiggerItem_setTiles(DiggerItem *s,MCToolTile009 **tiles,I32 count) { I32 i;memset(s->field_5C,0,sizeof(s->field_5C));s->field_50.size=0;for(i=0;i<count;i++) { if(!tiles[i] || tiles[i]->id<0 || tiles[i]->id>=256) { printf("Invalid digger tile ID\n");exit(97); }s->field_5C[tiles[i]->id]=TRUE;MCPtrVector_Push(&s->field_50,tiles[i]); } }
U0 DiggerItem_Destroy(DiggerItem *s) { MCPtrVector_Destroy(&s->field_50); }
F32 DiggerItem_getDestroySpeed(DiggerItem *s,MCToolTile009 *tile) { if(tile!=NULL && tile->id>=0 && tile->id<256 && s->field_5C[tile->id]!=0)return s->efficiencyMultiplier;return 1.0; }
I32 DiggerItem_getAttackDamage(DiggerItem *s) { return s->damageAgainstEntity; }
U0 DiggerItem_hurtEnemy(DiggerItem *s,MCItemContext009 *c,MCPacketItem009 *item) { c->hurtAndBreak(c->host,item,2); }
Bool DiggerItem_mineBlock(DiggerItem *s,MCItemContext009 *c,MCPacketItem009 *item) { c->hurtAndBreak(c->host,item,1);return TRUE; }
Bool DiggerItem_isHandEquipped(DiggerItem *s) { return TRUE; }

// Batch 009: minecraftpe/impl/item/WeaponItem.cpp
U0 WeaponItem_Init(WeaponItem *s,MCItemContext009 *c,I32 id,MCToolTier009 *tier,MCToolTiles009 *tiles) { MCItem009_Init(&s->base,c,id);s->tier=*tier;s->tiles=tiles;s->base.maxStackSize=1;s->base.maxDamage=tier->durability;s->damage=tier->damageAgainstEntity+4; }
MCPacketItem009 *WeaponItem_use(WeaponItem *s,MCPacketItem009 *item) { return item; }
I32 WeaponItem_getMaxUseDuration(WeaponItem *s) { return 72000; }
F32 WeaponItem_getDestroySpeed(WeaponItem *s,MCToolTile009 *t) { if(t->id==s->tiles->web->id)return 15.0;return 1.5; }
Bool WeaponItem_canDestroySpecial(WeaponItem *s,MCToolTile009 *t) { return t->id==s->tiles->web->id; }
I32 WeaponItem_getAttackDamage(WeaponItem *s) { return s->damage; }
U0 WeaponItem_hurtEnemy(WeaponItem *s,MCItemContext009 *c,MCPacketItem009 *it) { c->hurtAndBreak(c->host,it,1); }
Bool WeaponItem_mineBlock(WeaponItem *s,MCItemContext009 *c,MCPacketItem009 *it) { c->hurtAndBreak(c->host,it,2);return TRUE; }
Bool WeaponItem_isHandEquipped(WeaponItem *s) { return TRUE; }

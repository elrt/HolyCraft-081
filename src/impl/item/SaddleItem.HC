// Batch 009: minecraftpe/impl/item/SaddleItem.cpp
U0 SaddleItem_Init(SaddleItem *s,MCItemContext009 *c,I32 id) { MCItem009_Init(&s->base,c,id);s->base.maxStackSize=1; }
U0 SaddleItem_hurtEnemy(SaddleItem *s,MCItemContext009 *c,MCPacketItem009 *it,Bool attackerIsPlayer) { if(attackerIsPlayer) { if(c->interactEnemy)c->interactEnemy(c->host,it);else SaddleItem_interactEnemy(s,c,it); } }
U0 SaddleItem_interactEnemy(SaddleItem *s,MCItemContext009 *c,MCPacketItem009 *it) { }

// Batch 009: minecraftpe/impl/item/MinecartItem.cpp
U0 MinecartItem_Init(MinecartItem *s,MCItemContext009 *c,I32 id,I32 type) { MCItem009_Init(&s->base,c,id);s->type=type;s->base.maxStackSize=1; }
Bool MinecartItem_useOn(MinecartItem *s,MCItemContext009 *c,MCPacketItem009 *it,I32 x,I32 y,I32 z,I32 face,F32 fx,F32 fy,F32 fz) { F32 ax,ay,az;if(!c->isRail(c->host,c->getTile(c->host,x,y,z)))return FALSE;if(!c->isClient) { ax=x+0.5;ay=y+0.5;az=z+0.5;c->spawnMinecart(c->host,ax,ay,az,s->type); }it->count--;return TRUE; }

// Batch 009: minecraftpe/impl/item/SeedItem.cpp
U0 SeedItem_Init(SeedItem *s,MCItemContext009 *c,I32 id,I32 plant,I32 place) { MCItem009_Init(&s->base,c,id);s->placeId=place;s->plantId=plant; }
Bool SeedItem_useOn(SeedItem *s,MCItemContext009 *c,MCPacketItem009 *it,I32 x,I32 y,I32 z,I32 face,F32 fx,F32 fy,F32 fz) { if(face!=1 || c->getTile(c->host,x,y,z)!=s->placeId || !c->isEmptyTile(c->host,x,y+1,z))return FALSE;c->setTile(c->host,x,y+1,z,s->plantId,3);it->count--;return TRUE; }
Bool SeedItem_isSeed(SeedItem *s) { return TRUE; }

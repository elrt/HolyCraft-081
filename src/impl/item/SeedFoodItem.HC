// Batch 009: minecraftpe/impl/item/SeedFoodItem.cpp
U0 SeedFoodItem_Init(SeedFoodItem *s,MCItemContext009 *c,I32 id,I32 heal,F32 f48,I8 f4c,I32 plant,I32 place) { FoodItem_Init(&s->base,c,id,heal,f48,f4c);s->plantId=plant;s->placeId=place; }
Bool SeedFoodItem_useOn(SeedFoodItem *s,MCItemContext009 *c,MCPacketItem009 *it,I32 x,I32 y,I32 z,I32 face,F32 fx,F32 fy,F32 fz) { if(face!=1 || c->getTile(c->host,x,y,z)!=s->placeId || !c->isEmptyTile(c->host,x,y+1,z))return FALSE;c->setTile(c->host,x,y+1,z,s->plantId,3);it->count--;return TRUE; }

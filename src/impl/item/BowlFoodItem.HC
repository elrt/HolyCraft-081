// Batch 009: minecraftpe/impl/item/BowlFoodItem.cpp
U0 BowlFoodItem_Init(BowlFoodItem *s,MCItemContext009 *c,I32 id,I32 heal) { FoodItem_Init(&s->base,c,id,heal,0.6,0);s->base.base.maxStackSize=1; }
U0 BowlFoodItem_useTimeDepleted(BowlFoodItem *s,MCItemContext009 *c,MCPacketItem009 *it,MCPacketItem009 *out) { MCPacketItem009 previous;FoodItem_useTimeDepleted(&s->base,c,it,&previous);it->id=c->bowlID;it->count=1;it->aux=0;it->valid=TRUE;*out=*it; }

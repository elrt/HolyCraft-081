// Batch 009: minecraftpe/impl/item/FoodItem.cpp
U0 FoodItem_Init(FoodItem *s,MCItemContext009 *c,I32 id,I32 heal,F32 f48,I8 f4c) { MCItem009_Init(&s->base,c,id);s->healAmount=heal;s->field_48=f48;s->field_4C=f4c; }
MCPacketItem009 *FoodItem_use(FoodItem *s,MCItemContext009 *c,MCPacketItem009 *it) { if(!c->invulnerable && c->hurt)c->startUsing(c->host,it,FoodItem_getMaxUseDuration(s));return it; }
I32 FoodItem_getMaxUseDuration(FoodItem *s) { return 32; }
U0 FoodItem_useTimeDepleted(FoodItem *s,MCItemContext009 *c,MCPacketItem009 *it,MCPacketItem009 *out) { F32 volume=0.5,pitch;it->count--;c->heal(c->host,s->healAmount);pitch=Random_nextFloat(c->worldRandom)*0.1+0.9;c->playSound(c->host,"random.burp",volume,pitch);*out=*it; }
I32 FoodItem_getUseAnimation(FoodItem *s) { return 1; }
Bool FoodItem_isFood(FoodItem *s) { return TRUE; }

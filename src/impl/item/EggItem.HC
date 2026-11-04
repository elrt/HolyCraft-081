// Batch 009: minecraftpe/impl/item/EggItem.cpp
U0 EggItem_Init(EggItem *s,MCItemContext009 *c,I32 id) { MCItem009_Init(&s->base,c,id);s->base.maxStackSize=16; }
MCPacketItem009 *EggItem_use(EggItem *s,MCItemContext009 *c,MCPacketItem009 *it) { F32 denominator,volume=0.5,pitch,zero=0;if(!c->instabuild)it->count--;denominator=Random_nextFloat(c->itemRandom)*0.4+0.8;pitch=0.5/denominator;c->playSound(c->host,"random.bow",volume,pitch);if(!c->isClient)c->spawn(c->host,MCITEM_SPAWN_EGG,zero,zero,zero);return it; }

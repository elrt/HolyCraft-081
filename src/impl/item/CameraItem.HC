// Batch 009: minecraftpe/impl/item/CameraItem.cpp
U0 CameraItem_Init(CameraItem *s,MCItemContext009 *c,I32 id) { MCItem009_Init(&s->base,c,id); }
MCPacketItem009 *CameraItem_use(CameraItem *s,MCItemContext009 *c,MCPacketItem009 *it) { c->spawn(c->host,MCITEM_SPAWN_CAMERA,c->playerX,c->playerY,c->playerZ);return it; }

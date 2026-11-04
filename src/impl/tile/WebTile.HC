// Batch 005. Source: minecraftpe/impl/tile/WebTile.cpp
U0 WebTile_Init(WebTile *self,I32 id,MCString *name,Material *mat) { MCBlock_Init(self,id,name,mat); }
Bool WebTile_isCubeShaped(WebTile *self) { return FALSE; }
I32 WebTile_getRenderShape(WebTile *self) { return 1; }
AABB * WebTile_getAABB(WebTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z) { return NULL; }
Bool WebTile_isSolidRender(WebTile *self) { return FALSE; }
I32 WebTile_getResource(WebTile *self,I32 data,Random *r) { return MC_blocks.string; }
I32 WebTile_getRenderLayer(WebTile *self) { return 1; }
U0 WebTile_entityInside(WebTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,MCBlockActor *actor) { if(!actor || !actor->web)MCBlockMissing();actor->web(actor->context); }
U0 WebTile_Destroy(WebTile *self) { MCBlock_Destroy(self); }


// Batch 005. Source: minecraftpe/impl/tile/StoneTile.cpp
U0 StoneTile_Init(StoneTile *self,I32 id,MCString *name) { MCBlock_Init(self,id,name,Material_stone); }
I32 StoneTile_getResource(StoneTile *self,I32 data,Random *r) { return MC_blocks.stoneBrick; }
U0 StoneTile_Destroy(StoneTile *self) { MCBlock_Destroy(self); }


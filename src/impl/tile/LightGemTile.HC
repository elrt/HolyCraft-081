// Batch 005. Source: minecraftpe/impl/tile/LightGemTile.cpp
U0 LightGemTile_Init(LightGemTile *self,I32 id,MCString *name,Material *mat) { MCBlock_Init(self,id,name,mat);self->field_5C=255; }
I32 LightGemTile_getResource(LightGemTile *self,I32 data,Random *r) { return MC_blocks.yellowDust; }
I32 LightGemTile_getResourceCount(LightGemTile *self,Random *r) { return Random_genrand_int32(r)%3+2; }
U0 LightGemTile_Destroy(LightGemTile *self) { MCBlock_Destroy(self); }


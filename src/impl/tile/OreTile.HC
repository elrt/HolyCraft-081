// Batch 005. Source: minecraftpe/impl/tile/OreTile.cpp
U0 OreTile_Init(OreTile *self,I32 id,MCString *name) { MCBlock_Init(self,id,name,Material_stone); }
I32 OreTile_getResource(OreTile *self,I32 data,Random *r) { if(self->blockID==MC_blocks.coalOre)return MC_blocks.coal;if(self->blockID==MC_blocks.emeraldOre)return MC_blocks.emerald;if(self->blockID==MC_blocks.lapisOre)return MC_blocks.dye_powder;return self->blockID; }
I32 OreTile_getResourceCount(OreTile *self,Random *r) { if(self->blockID==MC_blocks.lapisOre)return Random_genrand_int32(r)%5+4;return 1; }
I32 OreTile_getSpawnResourcesAuxValue(OreTile *self,I32 data) { if(self->blockID==MC_blocks.lapisOre)return 4;return 0; }
U0 OreTile_Destroy(OreTile *self) { MCBlock_Destroy(self); }


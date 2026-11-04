// Batch 005. Source: minecraftpe/impl/tile/GravelTile.cpp
U0 GravelTile_Init(GravelTile *self,I32 id,MCString *name) { HeavyTile_InitSand(self,id,name); }
I32 GravelTile_getResource(GravelTile *self,I32 data,Random *r) { if(Random_genrand_int32(r)%10)return self->blockID;return MC_blocks.flint; }
U0 GravelTile_Destroy(GravelTile *self) { HeavyTile_Destroy(self); }


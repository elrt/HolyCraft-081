// Batch 005. Source: minecraftpe/impl/tile/GlassTile.cpp
U0 GlassTile_Init(GlassTile *self,I32 id,MCString *name,Material *mat) { HalfTransparentTile_Init(self,id,name,mat); }
I32 GlassTile_getRenderLayer(GlassTile *self) { return 1; }
I32 GlassTile_getResourceCount(GlassTile *self,Random *r) { return 0; }
U0 GlassTile_Destroy(GlassTile *self) { HalfTransparentTile_Destroy(self); }


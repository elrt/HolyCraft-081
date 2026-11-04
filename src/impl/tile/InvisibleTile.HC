// Batch 005. Source: minecraftpe/impl/tile/InvisibleTile.cpp
U0 InvisibleTile_Init(InvisibleTile *self,I32 id,MCString *name,Material *mat) { MCBlock_Init(self,id,name,mat); }
I32 InvisibleTile_getRenderShape(InvisibleTile *self) { return -1; }
U0 InvisibleTile_Destroy(InvisibleTile *self) { MCBlock_Destroy(self); }


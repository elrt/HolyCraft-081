// Batch 005. Source: minecraftpe/impl/tile/ClayTile.cpp
U0 ClayTile_Init(ClayTile *self,I32 id,MCString *name,Material *mat) { MCBlock_Init(self,id,name,mat);self->field_5C=255; }
I32 ClayTile_getResource(ClayTile *self,I32 data,Random *r) { return MC_blocks.clay; }
I32 ClayTile_getResourceCount(ClayTile *self,Random *r) { return 4; }
U0 ClayTile_Destroy(ClayTile *self) { MCBlock_Destroy(self); }


// Batch 005. Source: minecraftpe/impl/tile/DirtTile.cpp
U0 DirtTile_Init(DirtTile *self,I32 id,MCString *name,Material *mat) { MCBlock_Init(self,id,name,mat);self->field_5C=255; }
U0 DirtTile_Destroy(DirtTile *self) { MCBlock_Destroy(self); }


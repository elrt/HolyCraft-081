// Batch 005. Source: minecraftpe/impl/tile/MetalTile.cpp
U0 MetalTile_Init(MetalTile *self,I32 id,MCString *name) { MCBlock_Init(self,id,name,Material_metal); }
TextureUVCoordinateSet * MetalTile_getTexture(MetalTile *self,I32 side) { return &self->textureUV; }
U0 MetalTile_Destroy(MetalTile *self) { MCBlock_Destroy(self); }


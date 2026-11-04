// Batch 005. Source: minecraftpe/impl/tile/MultiTextureTile.cpp
U0 MultiTextureTile_Init(MultiTextureTile *self,I32 id,MCString *name,Material *mat) { MCBlock_Init(self,id,NULL,mat);TextureAtlasTextureItem_CopyInit(&self->field_7C,MCBlock_Texture(name));self->field_A8=self->field_7C.uvCount; }
TextureUVCoordinateSet * MultiTextureTile_getTexture(MultiTextureTile *self,I32 side,I32 data) { if(data<0 || data>=self->field_A8)return &self->textureUV;return TextureAtlasTextureItem_getUV(&self->field_7C,data); }
I32 MultiTextureTile_getSpawnResourcesAuxValue(MultiTextureTile *self,I32 data) { return data; }
U0 MultiTextureTile_Destroy(MultiTextureTile *self) { TextureAtlasTextureItem_Destroy(&self->field_7C);MCBlock_Destroy(self); }


// Batch 005. Source: minecraftpe/impl/tile/ClothTile.cpp
U0 ClothTile_Init(ClothTile *self,I32 id) { MCBlock_Init(self,id,NULL,Material_cloth);TextureAtlasTextureItem_CopyInit(&self->tex,MCBlock_TextureC("wool"));self->textureUV=*TextureAtlasTextureItem_getUV(&self->tex,0); }
TextureUVCoordinateSet * ClothTile_getTexture(ClothTile *self,I32 side,I32 data) { if(data)return TextureAtlasTextureItem_getUV(&self->tex,data);return &self->textureUV; }
I32 ClothTile_getSpawnResourcesAuxValue(ClothTile *self,I32 data) { return data; }
U0 ClothTile_Destroy(ClothTile *self) { TextureAtlasTextureItem_Destroy(&self->tex);MCBlock_Destroy(self); }


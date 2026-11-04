// Batch 005. Source: minecraftpe/impl/tile/WoodTile.cpp
U0 WoodTile_Init(WoodTile *self,I32 id) { MCBlock_Init(self,id,NULL,Material_wood);TextureAtlasTextureItem_CopyInit(&self->field_80,MCBlock_TextureC("planks")); }
TextureUVCoordinateSet * WoodTile_getTexture(WoodTile *self,I32 side,I32 data) { return TextureAtlasTextureItem_getUV(&self->field_80,data); }
U0 WoodTile_getTypeDescriptionId(WoodTile *self,MCString *out,I32 data) { if(data(U32)>3)data=0;MCString_CopyInit(out,&MC_blocks.woodNames[data]); }
I32 WoodTile_getSpawnResourcesAuxValue(WoodTile *self,I32 data) { return data; }
U0 WoodTile_Destroy(WoodTile *self) { TextureAtlasTextureItem_Destroy(&self->field_80);MCBlock_Destroy(self); }


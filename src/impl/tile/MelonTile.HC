// Batch 005. Source: minecraftpe/impl/tile/MelonTile.cpp
U0 MelonTile_Init(MelonTile *self,I32 id) { MCBlock_Init(self,id,NULL,Material_vegetable);self->field_7C=MCBlock_UV("melon",0);self->field_94=MCBlock_UV("melon",1); }
TextureUVCoordinateSet * MelonTile_getTexture(MelonTile *self,I32 side) { if(side>1)return &self->field_7C;return &self->field_94; }
TextureUVCoordinateSet * MelonTile_getTextureWorld(MelonTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 side) { return MelonTile_getTexture(self,side); }
I32 MelonTile_getResource(MelonTile *self,I32 data,Random *r) { return MC_blocks.melon; }
I32 MelonTile_getResourceCount(MelonTile *self,Random *r) { return Random_genrand_int32(r)%5+3; }
U0 MelonTile_Destroy(MelonTile *self) { MCBlock_Destroy(self); }


// Batch 005. Source: minecraftpe/impl/tile/HayBlockTile.cpp
U0 HayBlockTile_Init(HayBlockTile *self,I32 id) { RotatedPillarTile_Init(self,id,Material_dirt);self->field_80=MCBlock_UV("hayblock",0);self->field_98=MCBlock_UV("hayblock",1);self->dirTexture=&HayBlockTile__dir; }
TextureUVCoordinateSet * HayBlockTile_getDirTexture(HayBlockTile *self,I32 side,I32 data) { if(side)return &self->field_98;return &self->field_80; }
TextureUVCoordinateSet *HayBlockTile__dir(MCBlockState *self,I32 side,I32 data) { return HayBlockTile_getDirTexture(self(HayBlockTile*),side,data); }
U0 HayBlockTile_Destroy(HayBlockTile *self) { RotatedPillarTile_Destroy(self); }


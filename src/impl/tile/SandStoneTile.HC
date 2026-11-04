// Batch 005. Source: minecraftpe/impl/tile/SandStoneTile.cpp
U0 SandStoneTile_Init(SandStoneTile *self,I32 id,MCString *name) { MultiTextureTile_Init(self,id,name,Material_stone);self->field_B0=MCBlock_UV("sandstone",3);self->field_C8=MCBlock_UV("sandstone",4);self->field_5C=3; }
TextureUVCoordinateSet * SandStoneTile_getTexture(SandStoneTile *self,I32 side,I32 data) { if(side==1)return &self->field_B0;if(side)return MultiTextureTile_getTexture(self,side,data);if(data>0)return &self->field_B0;return &self->field_C8; }
U0 SandStoneTile_Destroy(SandStoneTile *self) { MultiTextureTile_Destroy(self); }


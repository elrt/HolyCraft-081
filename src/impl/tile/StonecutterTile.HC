// Batch 005. Source: minecraftpe/impl/tile/StonecutterTile.cpp
U0 StonecutterTile_Init(StonecutterTile *self,I32 id) { MCBlock_Init(self,id,NULL,Material_stone);self->field_80=MCBlock_UV("stonecutter",0);self->field_98=MCBlock_UV("stonecutter",1);self->field_B0=MCBlock_UV("stonecutter",2);self->field_C8=MCBlock_UV("stonecutter",3); }
TextureUVCoordinateSet * StonecutterTile_getTexture(StonecutterTile *self,I32 side) { if(side==1)return &self->field_B0;if(!side)return &self->field_C8;if((side-2)(U32)>1)return &self->field_98;return &self->field_80; }
Bool StonecutterTile_use(StonecutterTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,MCBlockActor *p) { if(!p || !p->stonecut)MCBlockMissing();p->stonecut(p->context,x,y,z);return TRUE; }
U0 StonecutterTile_Destroy(StonecutterTile *self) { MCBlock_Destroy(self); }


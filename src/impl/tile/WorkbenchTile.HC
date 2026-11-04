// Batch 005. Source: minecraftpe/impl/tile/WorkbenchTile.cpp
U0 WorkbenchTile_Init(WorkbenchTile *self,I32 id) { MCBlock_Init(self,id,NULL,Material_wood);self->field_80=MCBlock_UV("planks",0);self->field_98=MCBlock_UV("crafting_table",0);self->field_B0=MCBlock_UV("crafting_table",1);self->field_C8=MCBlock_UV("crafting_table",2); }
TextureUVCoordinateSet * WorkbenchTile_getTexture(WorkbenchTile *self,I32 side) { if(side==1)return &self->field_98;if(!side)return &self->field_80;if((side-4)(U32)>1)return &self->field_C8;return &self->field_B0; }
Bool WorkbenchTile_use(WorkbenchTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,MCBlockActor *p) { if(!p || !p->craft)MCBlockMissing();p->craft(p->context,x,y,z,1);return TRUE; }
U0 WorkbenchTile_Destroy(WorkbenchTile *self) { MCBlock_Destroy(self); }


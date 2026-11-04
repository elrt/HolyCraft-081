// Batch 005. Source: minecraftpe/impl/tile/TransparentTile.cpp
U0 TransparentTile_Init(TransparentTile *self,I32 id,MCString *name,Material *mat) { MCBlock_Init(self,id,name,mat);self->field_7C=FALSE;self->field_7D=0;self->field_7E=0;self->field_7F=0; }
Bool TransparentTile_shouldRenderFace(TransparentTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 side) { I32 id=MCLeafWorld_getTile(w,x,y,z);if(!self->field_7C && id==self->blockID)return self->field_7C;return MCBlock_Face(self,w,x,y,z,side); }
Bool TransparentTile_isSolidRender(TransparentTile *self) { return FALSE; }
U0 TransparentTile_Destroy(TransparentTile *self) { MCBlock_Destroy(self); }


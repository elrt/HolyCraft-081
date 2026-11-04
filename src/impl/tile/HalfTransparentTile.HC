// Batch 005. Source: minecraftpe/impl/tile/HalfTransparentTile.cpp
U0 HalfTransparentTile_Init(HalfTransparentTile *self,I32 id,MCString *name,Material *mat) { MCBlock_Init(self,id,name,mat);self->field_80=FALSE; }
Bool HalfTransparentTile_shouldRenderFace(HalfTransparentTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 side) { I32 id=MCLeafWorld_getTile(w,x,y,z);if(!self->field_80 && id==self->blockID)return self->field_80;return MCBlock_Face(self,w,x,y,z,side); }
Bool HalfTransparentTile_isSolidRender(HalfTransparentTile *self) { return FALSE; }
I32 HalfTransparentTile_getRenderLayer(HalfTransparentTile *self) { return 2; }
U0 HalfTransparentTile_Destroy(HalfTransparentTile *self) { MCBlock_Destroy(self); }


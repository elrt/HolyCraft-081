// Batch 005. Source: minecraftpe/impl/rendering/model/ModelPart.cpp
U0 ModelPart__init(ModelPart *self,I32 width,I32 height) { self->xOffset=0;self->yOffset=0;self->zOffset=0;self->xRotAngle=0;self->yRotAngle=0;self->zRotAngle=0;self->texWidth=width;self->texHeight=height;self->field_50=0;self->mirror=FALSE;self->field_4C=FALSE;self->field_1D=TRUE;MeshBuffer_reset(&self->meshBuffer); }
U0 ModelPart_Init(ModelPart *self,I32 x=0,I32 y=0,I32 width=64,I32 height=32) { memset(self,0,sizeof(ModelPart));MCPtrVector_Init(&self->cubes);MCPtrVector_Init(&self->children);MCString_Init(&self->field_38);MeshBuffer_Init(&self->meshBuffer);self->texOffsetX=x;self->texOffsetY=y;ModelPart__init(self,width,height); }
U0 ModelPart_InitModel(ModelPart *self,Model *model,I32 x,I32 y,I32 width,I32 height) { ModelPart_Init(self,x,y,width,height);self->parent=model; }
U0 ModelPart_InitName(ModelPart *self,MCString *name) { ModelPart_Init(self);MCString_Assign(&self->field_38,name); }
ModelPart *ModelPart_addBox(ModelPart *self,F32 x,F32 y,F32 z,I32 width,I32 height,I32 depth,F32 inflate=0) { Cube *cube=MC_Alloc(sizeof(Cube));Cube_Init(cube,self,self->texOffsetX,self->texOffsetY,x,y,z,width,height,depth,inflate);MCPtrVector_Push(&self->cubes,cube);return self; }
ModelPart *ModelPart_addBoxName(ModelPart *self,MCString *name,F32 x,F32 y,F32 z,I32 width,I32 height,I32 depth) { ModelPart_addBox(self,x,y,z,width,height,depth);Cube *c=self->cubes.data[self->cubes.size-1];I64 size=self->field_38.size+name->size+1;U8 *path=MC_Alloc(size+1);memcpy(path,MCString_CStr(&self->field_38),self->field_38.size);path[self->field_38.size]='.';memcpy(path+self->field_38.size+1,MCString_CStr(name),name->size);path[size]=0;MCString str;MCString_FromC(&str,path);Cube_setId(c,&str);MCString_Destroy(&str);free(path);return self; }
U0 ModelPart_addChild(ModelPart *self,ModelPart *child) { MCPtrVector_Push(&self->children,child); }
U0 ModelPart_compile(ModelPart *self,F32 scale) { if(!MC_modelGraphics.begin || !MC_modelGraphics.end)MCModelMissing();MC_modelGraphics.begin(24*self->cubes.size);I64 i;Cube *cube;for(i=0;i<self->cubes.size;i++) { cube=self->cubes.data[i];Cube_compile(cube,&MC_modelGraphics.vertices,scale); }MeshBuffer next;MeshBuffer_Init(&next);MC_modelGraphics.end(&next);MeshBuffer_Move(&self->meshBuffer,&next); }
U0 ModelPart_draw(ModelPart *self,F32 scale) { if(!MeshBuffer_isValid(&self->meshBuffer))ModelPart_compile(self,scale);if(self->noFaceCull) { glDisable(GL_CULL_FACE);glEnable(GL_ALPHA_TEST);MeshBuffer_render(&self->meshBuffer);glDisable(GL_ALPHA_TEST);glEnable(GL_CULL_FACE); }else MeshBuffer_render(&self->meshBuffer); }
U0 ModelPart_drawSlow(ModelPart *self,F32 scale) {}
U0 ModelPart_mimic(ModelPart *self,ModelPart *other) { self->xOffset=other->xOffset;self->yOffset=other->yOffset;self->zOffset=other->zOffset;self->xRotAngle=other->xRotAngle;self->yRotAngle=other->yRotAngle;self->zRotAngle=other->zRotAngle; }
ModelPart *ModelPart_Assign(ModelPart *self,ModelPart *other) { if(self==other)return self;ModelPart_reset(self);if(self->field_38.size || other->field_38.size)MCString_Assign(&self->field_38,&other->field_38);self->texOffsetX=other->texOffsetX;self->texOffsetY=other->texOffsetY;self->texWidth=other->texWidth;self->texHeight=other->texHeight;self->mirror=other->mirror;ModelPart_setModel(self,other->parent);I64 i;Cube *copy;for(i=0;i<other->cubes.size;i++) { copy=MC_Alloc(sizeof(Cube));Cube_CopyInit(copy,other->cubes.data[i]);MCPtrVector_Push(&self->cubes,copy); }ModelPart_mimic(self,other);return self; }
U0 ModelPart_setModel(ModelPart *self,Model *model) { I64 i,j;if(self->parent) { for(i=0;i<self->parent->parts.size;i++)if(self->parent->parts.data[i]==self) { for(j=i+1;j<self->parent->parts.size;j++)self->parent->parts.data[j-1]=self->parent->parts.data[j];self->parent->parts.size--;break; } }if(model)MCPtrVector_Push(&model->parts,self);self->parent=model; }
U0 ModelPart_reset(ModelPart *self) { I64 i;Cube *c;for(i=0;i<self->cubes.size;i++) { c=self->cubes.data[i];if(c) { Cube_Destroy(c);free(c); } }self->cubes.size=0;ModelPart_setModel(self,NULL);MeshBuffer_reset(&self->meshBuffer); }
U0 ModelPart_Destroy(ModelPart *self) { ModelPart_reset(self);MCString_Destroy(&self->field_38);MCPtrVector_Destroy(&self->cubes);MCPtrVector_Destroy(&self->children); }
U0 ModelPart_render(ModelPart *self,F32 a2) {
if ( ! self -> field_4C && self -> field_1D ) {
 if ( self -> xRotAngle != 0 || self -> yRotAngle != 0 || self -> zRotAngle != 0 ) {
 glPushMatrix ( ) ;
 glTranslatef ( a2 * self -> xOffset , a2 * self -> yOffset , a2 * self -> zOffset ) ;
 if ( self -> zRotAngle != 0.0 ) glRotatef ( Mth_rad2deg ( self -> zRotAngle ) , 0.0 , 0.0 , 1.0 ) ;
 if ( self -> yRotAngle != 0.0 ) glRotatef ( Mth_rad2deg ( self -> yRotAngle ) , 0.0 , 1.0 , 0.0 ) ;
 if ( self -> xRotAngle != 0.0 ) glRotatef ( Mth_rad2deg ( self -> xRotAngle ) , 1.0 , 0.0 , 0.0 ) ;
 ModelPart_draw ( self , a2 ) ;
 if ( ! ( self -> children. size == 0 ) ) {
 for ( I32 i = 0 ;
 i < self -> children. size ;
 ++ i ) {
 ModelPart * child = self -> children. data [ i ] ;
 ModelPart_render ( child , a2 ) ;
 
}
 
}
 glPopMatrix ( ) ;
 return ;
 
}
 if ( self -> xOffset != 0.0 || self -> yOffset != 0.0 || self -> zOffset != 0.0 ) {
 glPushMatrix ( ) ;
 glTranslatef ( a2 * self -> xOffset , a2 * self -> yOffset , a2 * self -> zOffset ) ;
 ModelPart_draw ( self , a2 ) ;
 if ( ! ( self -> children. size == 0 ) ) {
 for ( I32 i = 0 ;
 i < self -> children. size ;
 ++ i ) {
 ModelPart * child = self -> children. data [ i ] ;
 ModelPart_render ( child , a2 ) ;
 
}
 
}
 glPopMatrix ( ) ;
 return ;
 
}
 ModelPart_draw ( self , a2 ) ;
 if ( ! ( self -> children. size == 0 ) ) {
 for ( I32 i = 0 ;
 i < self -> children. size ;
 ++ i ) {
 ModelPart * child = self -> children. data [ i ] ;
 ModelPart_render ( child , a2 ) ;
 
}
 
}
 
}
}
U0 ModelPart_renderHorrible(ModelPart *self,F32 a2) {
if ( ! self -> field_4C && self -> field_1D ) {
 if ( self -> xRotAngle != 0.0 || self -> yRotAngle != 0.0 || self -> zRotAngle != 0.0 ) {
 glPushMatrix ( ) ;
 glTranslatef ( a2 * self -> xOffset , a2 * self -> yOffset , a2 * self -> zOffset ) ;
 if ( self -> zRotAngle != 0.0 ) {
 glRotatef ( Mth_rad2deg ( self -> zRotAngle ) , 0.0 , 0.0 , 1.0 ) ;
 
}
 if ( self -> yRotAngle != 0.0 ) {
 glRotatef ( Mth_rad2deg ( self -> yRotAngle ) , 0.0 , 1.0 , 0.0 ) ;
 
}
 if ( self -> xRotAngle != 0.0 ) {
 glRotatef ( Mth_rad2deg ( self -> xRotAngle ) , 1.0 , 0.0 , 0.0 ) ;
 
}
 ModelPart_drawSlow ( self , a2 ) ;
 glPopMatrix ( ) ;
 return ;
 
}
 if ( self -> xOffset != 0.0 || self -> yOffset != 0.0 || self -> zOffset != 0.0 ) {
 glPushMatrix ( ) ;
 glTranslatef ( a2 * self -> xOffset , a2 * self -> yOffset , a2 * self -> zOffset ) ;
 ModelPart_drawSlow ( self , a2 ) ;
 glPopMatrix ( ) ;
 return ;
 
}
 ModelPart_drawSlow ( self , a2 ) ;
 
}
}
U0 ModelPart_translateTo(ModelPart *self,F32 a2) {
if ( self -> xRotAngle == 0.0 && self -> yRotAngle == 0.0 && self -> zRotAngle == 0.0 ) {
 if ( self -> xOffset != 0.0 || self -> yOffset != 0.0 || self -> zOffset != 0.0 ) {
 glTranslatef ( self -> xOffset * a2 , a2 * self -> yOffset , a2 * self -> zOffset ) ;
 
}
 
}
 else {
 glTranslatef ( a2 * self -> xOffset , a2 * self -> yOffset , a2 * self -> zOffset ) ;
 if ( self -> zRotAngle != 0.0 ) {
 glRotatef ( Mth_rad2deg ( self -> zRotAngle ) , 0.0 , 0.0 , 1.0 ) ;
 
}
 if ( self -> yRotAngle != 0.0 ) {
 glRotatef ( Mth_rad2deg ( self -> yRotAngle ) , 0.0 , 1.0 , 0.0 ) ;
 
}
 if ( self -> xRotAngle != 0.0 ) {
 glRotatef ( Mth_rad2deg ( self -> xRotAngle ) , 1.0 , 0.0 , 0.0 ) ;
 
}
 
}
}

U0 ModelPart_setPos(ModelPart *self,F32 x,F32 y,F32 z) { self->xOffset=x;self->yOffset=y;self->zOffset=z; }
ModelPart *ModelPart_setTexSize(ModelPart *self,I32 width,I32 height) { self->texWidth=width;self->texHeight=height;return self; }
ModelPart *ModelPart_texOffs(ModelPart *self,I32 x,I32 y) { self->texOffsetX=x;self->texOffsetY=y;return self; }


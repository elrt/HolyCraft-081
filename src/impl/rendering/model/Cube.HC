// Batch 005. Source: minecraftpe/impl/rendering/model/Cube.cpp
U0 Cube_Init(Cube *self,ModelPart *a2,I32 a3,I32 a4,F32 a5,F32 a6,F32 a7,I32 a8,I32 a9,I32 a10,F32 a11) {
for ( I32 i = 0 ;
 i < 8 ;
 i ++ ) {
 Vec3_Init ( & self -> field_0 [ i ] . vec ) ;
 
}
 self -> field_29C = a5 ;
 self -> field_2A0 = a6 ;
 self -> field_2A4 = a7 ;
 MCString_Init ( & self -> id ) ;
 F32 v17 = a5 + (a8)(F32) ;
 F32 v18 = a6 + (a9)(F32) ;
 self -> field_2A8 = v17 ;
 F32 v19 = a7 + (a10)(F32) ;
 self -> field_2AC = v18 ;
 self -> field_2B0 = v19 ;
 F32 v20 = a5 - a11 ;
 F32 v21 = a6 - a11 ;
 F32 v22 = a7 - a11 ;
 F32 v23 = v17 + a11 ;
 F32 v24 = v18 + a11 ;
 F32 v25 = v19 + a11 ;
 if ( ! a2 -> mirror ) {
 F32 v26 = v23 ;
 v23 = a5 - a11 ;
 v20 = v26 ;
 
}
 Vec3_Init ( & self -> field_0 [ 0 ] . vec , v23 , v21 , v22 ) ;
 self -> field_0 [ 0 ] . u = 0 ;
 self -> field_0 [ 0 ] . v = 0 ;
 Vec3_Init ( & self -> field_0 [ 1 ] . vec , v20 , v21 , v22 ) ;
 self -> field_0 [ 1 ] . u = 0 ;
 self -> field_0 [ 1 ] . v = 8 ;
 Vec3_Init ( & self -> field_0 [ 2 ] . vec , v20 , v24 , v22 ) ;
 self -> field_0 [ 2 ] . u = 8 ;
 self -> field_0 [ 2 ] . v = 8 ;
 Vec3_Init ( & self -> field_0 [ 3 ] . vec , v23 , v24 , v22 ) ;
 self -> field_0 [ 3 ] . u = 8 ;
 self -> field_0 [ 3 ] . v = 0 ;
 Vec3_Init ( & self -> field_0 [ 4 ] . vec , v23 , v21 , v25 ) ;
 self -> field_0 [ 4 ] . u = 0 ;
 self -> field_0 [ 4 ] . v = 0 ;
 Vec3_Init ( & self -> field_0 [ 5 ] . vec , v20 , v21 , v25 ) ;
 self -> field_0 [ 5 ] . u = 0 ;
 self -> field_0 [ 5 ] . v = 8 ;
 Vec3_Init ( & self -> field_0 [ 6 ] . vec , v20 , v24 , v25 ) ;
 self -> field_0 [ 6 ] . u = 8 ;
 self -> field_0 [ 6 ] . v = 8 ;
 Vec3_Init ( & self -> field_0 [ 7 ] . vec , v23 , v24 , v25 ) ;
 self -> field_0 [ 7 ] . u = 8 ;
 self -> field_0 [ 7 ] . v = 0 ;
 I32 texWidth = (a2->texWidth)(I32) ;
 I32 v44 = a3 + a10 + a8 ;
 I32 v45 = a4 + a10 ;
 I32 texHeight = (a2->texHeight)(I32) ;
 PolygonQuad_InitPixels ( & self -> quads [ 0 ] , & self -> field_0 [ 5 ] , & self -> field_0 [ 1 ] , & self -> field_0 [ 2 ] , & self -> field_0 [ 6 ] , v44 , v45 , v44 + a10 , v45 + a9 , texWidth , texHeight ) ;
 PolygonQuad_InitPixels ( & self -> quads [ 1 ] , & self -> field_0 [ 0 ] , & self -> field_0 [ 4 ] , & self -> field_0 [ 7 ] , & self -> field_0 [ 3 ] , a3 , v45 , a3 + a10 , v45 + a9 , texWidth , texHeight ) ;
 PolygonQuad_InitPixels ( & self -> quads [ 2 ] , & self -> field_0 [ 5 ] , & self -> field_0 [ 4 ] , & self -> field_0 [ 0 ] , & self -> field_0 [ 1 ] , a3 + a10 , a4 , v44 , a4 + a10 , texWidth , texHeight ) ;
 PolygonQuad_InitPixels ( & self -> quads [ 3 ] , & self -> field_0 [ 2 ] , & self -> field_0 [ 3 ] , & self -> field_0 [ 7 ] , & self -> field_0 [ 6 ] , v44 , a4 + a10 , v44 + a8 , a4 , texWidth , texHeight ) ;
 PolygonQuad_InitPixels ( & self -> quads [ 4 ] , & self -> field_0 [ 1 ] , & self -> field_0 [ 0 ] , & self -> field_0 [ 3 ] , & self -> field_0 [ 2 ] , a3 + a10 , v45 , v44 , v45 + a9 , texWidth , texHeight ) ;
 PolygonQuad_InitPixels ( & self -> quads [ 5 ] , & self -> field_0 [ 4 ] , & self -> field_0 [ 5 ] , & self -> field_0 [ 6 ] , & self -> field_0 [ 7 ] , v44 + a10 , v45 , v44 + a10 + a8 , v45 + a9 , texWidth , texHeight ) ;
 if ( a2 -> mirror ) {
 for ( I32 i = 0 ;
 i != 6 ;
 ++ i ) {
 PolygonQuad_mirror ( & self -> quads [ i ] ) ;
 
}
 
}
}
U0 Cube_compile(Cube *self,MCVertexSink *sink,F32 scale) { I32 i;for(i=0;i<6;i++)PolygonQuad_render(&self->quads[i],sink,scale,-1); }
Cube *Cube_setId(Cube *self,MCString *id) { MCString_Assign(&self->id,id);return self; }
U0 Cube_CopyInit(Cube *self,Cube *other) { memcpy(self,other,sizeof(Cube));MCString_CopyInit(&self->id,&other->id); }
U0 Cube_Destroy(Cube *self) { MCString_Destroy(&self->id); }


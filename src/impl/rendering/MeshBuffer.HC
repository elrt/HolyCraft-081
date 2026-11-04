// Batch 003. Source: minecraftpe/impl/rendering/MeshBuffer.cpp
Bool MeshBuffer__load(MeshBuffer *self,MeshBufferVertexFormat *a2,U0 *a3,I32 a4,U0 *a5,U32 a6,I32 a7,U32 a8) {U32 v11 ;
 I32 v12 ;
 if ( ! a3 || a4 <= 2 || ! a8 || ! a2 ) return 0 ;
 self -> arraysCount = a4 ;
 self -> drawMode = a8 ;
 self -> elementsCount = a6 ;
 v11 = GL_UNSIGNED_SHORT ;
 self -> vertexFormat = a2 ;
 if ( a7 != 2 ) v11 = GL_UNSIGNED_BYTE ;
 self -> drawType = v11 ;
 v12 = a2 -> stride * a4 ;
 if ( ! self -> arrayBuffer ) {
 self -> arrayBuffer = GLBufferPool_get ( & glBufferPool ) ;
 if ( self -> arrayBuffer == 0 ) return 0 ;
 
}
 glBindBuffer ( GL_ARRAY_BUFFER , self -> arrayBuffer ) ;
 glBufferData ( GL_ARRAY_BUFFER , v12 , a3 , GL_STATIC_DRAW ) ;
 if ( self -> elementsCount && a7 && a5 != NULL ) {
 if ( ! self -> arrayElementsBuffer ) {
 self -> arrayElementsBuffer = GLBufferPool_get ( & glBufferPool ) ;
 if ( ! self -> arrayElementsBuffer ) return 0 ;
 
}
 glBindBuffer ( GL_ELEMENT_ARRAY_BUFFER , self -> arrayElementsBuffer ) ;
 glBufferData ( GL_ELEMENT_ARRAY_BUFFER , self -> elementsCount * a7 , a5 , GL_STATIC_DRAW ) ;
 
}
 else {
 if ( self -> arrayElementsBuffer ) GLBufferPool_release ( & glBufferPool , self -> arrayElementsBuffer ) ;
 self -> arrayElementsBuffer = 0 ;
 
}
 return glGetError ( ) == 0 ;
}
U0 MeshBuffer__move(MeshBuffer *self,MeshBuffer *a2) {MeshBuffer_reset ( self ) ;
 self -> arrayBuffer = a2 -> arrayBuffer ;
 self -> arraysCount = a2 -> arraysCount ;
 self -> vertexFormat = a2 -> vertexFormat ;
 self -> arrayElementsBuffer = a2 -> arrayElementsBuffer ;
 self -> elementsCount = a2 -> elementsCount ;
 self -> drawType = a2 -> drawType ;
 self -> drawMode = a2 -> drawMode ;
 a2 -> arrayElementsBuffer = 0 ;
 a2 -> arrayBuffer = 0 ;
 a2 -> elementsCount = 0 ;
 a2 -> arraysCount = 0 ;
 a2 -> vertexFormat = 0 ;
}
U0 MeshBuffer_render(MeshBuffer *self) {if ( self -> arrayBuffer && self -> arraysCount > 3 && self -> drawMode != 0 && self -> vertexFormat != NULL ) {
 glBindBuffer ( GL_ARRAY_BUFFER , self -> arrayBuffer ) ;
 glBindBuffer ( GL_ELEMENT_ARRAY_BUFFER , self -> arrayElementsBuffer ) ;
 MeshBufferVertexFormat_bindArrays ( self -> vertexFormat ) ;
 if ( self -> elementsCount ) {
 glDrawElements ( self -> drawMode , self -> elementsCount , self -> drawType , 0 ) ;
 
}
 else {
 glDrawArrays ( self -> drawMode , 0 , self -> arraysCount ) ;
 
}
 
}
}
U0 MeshBuffer_reset(MeshBuffer *self) {if ( self -> arrayBuffer ) GLBufferPool_release ( & glBufferPool , self -> arrayBuffer ) ;
 if ( self -> arrayElementsBuffer ) GLBufferPool_release ( & glBufferPool , self -> arrayElementsBuffer ) ;
 self -> arrayBuffer = 0 ;
 self -> arraysCount = 0 ;
 self -> arrayElementsBuffer = 0 ;
 self -> elementsCount = 0 ;
 self -> drawMode = 0 ;
 self -> drawType = 0 ;
 self -> vertexFormat = 0 ;
}
Bool MeshBuffer_load(MeshBuffer *self,MeshBufferVertexFormat *a2,U0 *a3,I32 a4,U0 *a5,U32 a6,I32 a7,U32 a8) {if ( MeshBuffer__load ( self , a2 , a3 , a4 , a5 , a6 , a7 , a8 ) ) {
 return 1 ;
 
}
 MeshBuffer_reset ( self ) ;
 return 0 ;
}
MeshBuffer *MeshBuffer_Move(MeshBuffer *self,MeshBuffer *other) { MeshBuffer__move(self,other);return self; }
U0 MeshBuffer_MoveInit(MeshBuffer *self,MeshBuffer *other) { MeshBuffer_Init(self);MeshBuffer__move(self,other); }
U0 MeshBufferVertexFormat_bindArrays(MeshBufferVertexFormat *self) {glVertexPointer ( 3 , GL_FLOAT , self -> stride , (self->offsets[0])(U0*) ) ;
 U8 texOffset = self -> offsets [ 1 ] ;
 if ( texOffset != 255 ) glTexCoordPointer ( 2 , GL_FLOAT , self -> stride , (texOffset)(U0*) ) ;
 U8 colOffset = self -> offsets [ 2 ] ;
 if ( colOffset != 255 ) glColorPointer ( 4 , GL_UNSIGNED_BYTE , self -> stride , (colOffset)(U0*) ) ;
 U8 normOffset = self -> offsets [ 3 ] ;
 if ( normOffset != 255 ) glNormalPointer ( GL_BYTE , self -> stride , (normOffset)(U0*) ) ;
}


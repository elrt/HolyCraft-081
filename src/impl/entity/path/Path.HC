// Batch 004. Source: minecraftpe/impl/entity/path/Path.cpp
U0 Path_Init(Path *self,Node **nodes,I32 size) { I32 i; self->currentIndex=0; self->pathSize=size; self->size=size; self->nodes=MC_Alloc(size*sizeof(Node*)); for(i=0;i<size;i++) { self->nodes[i]=MC_Alloc(sizeof(Node)); *self->nodes[i]=*nodes[i]; } }
U0 Path_Destroy(Path *self) { I32 i; if(self->nodes) { for(i=0;i<self->pathSize;i++) free(self->nodes[i]); free(self->nodes); } self->nodes=NULL; self->size=0; self->pathSize=0; }
U0 Path_getPos(Path *self,F32 entityWidth,I32 index,Vec3 *out) { Node *n=self->nodes[index]; F32 width=entityWidth+1.0; I32 cells=width; F32 offset=cells/2.0; F32 x=n->xCoord+offset,y=n->yCoord,z=n->zCoord+offset; Vec3_Init(out,x,y,z); }
U0 Path_currentPos(Path *self,Vec3 *out) { Node *n=self->nodes[self->currentIndex]; F32 x=n->xCoord,y=n->yCoord,z=n->zCoord; Vec3_Init(out,x,y,z); }
U0 Path_currentPosForWidth(Path *self,F32 width,Vec3 *out) { Path_getPos(self,width,self->currentIndex,out); }
Bool Path_sameAs(Path *self,Path *a2) { if ( ! a2 ) return 0 ;
 if ( a2 -> pathSize != self -> pathSize ) return 0 ;
 for ( I32 i = 0 ;
 i != a2 -> pathSize ;
 ++ i ) {
 Node * v4 = self -> nodes [ i ] ;
 Node * v5 = a2 -> nodes [ i ] ;
 if ( v4 -> xCoord != v5 -> xCoord || v4 -> yCoord != v5 -> yCoord || v4 -> zCoord != v5 -> zCoord ) {
 return 0 ;
 
}
 
}
 return 1 ;
 }
Bool Path_endsIn(Path *self,Vec3 *a2) { Node * v3 = Path_last ( self ) ;
 if ( v3 ) {
 return v3 -> xCoord == (a2->x)(I32) && v3 -> yCoord == (a2->y)(I32) && v3 -> zCoord == (a2->z)(I32) ;
 
}
 return 0 ;
 }
Bool Path_endsInXZ(Path *self,Vec3 *a2) { Node * v3 = Path_last ( self ) ;
 if ( v3 ) {
 return v3 -> xCoord == (a2->x)(I32) && v3 -> zCoord == (a2->z)(I32) ;
 
}
 return 0 ;
 }
Node* Path_last(Path *self) { if ( self -> size <= 0 ) return 0 ;
 return self -> nodes [ self -> size - 1 ] ;
 }
Node* Path_get(Path *self,I32 a2) { return self -> nodes [ a2 ] ;
 }
I32 Path_getSize(Path *self) { return self -> size ;
 }
U0 Path_setSize(Path *self,I32 a2) { self -> size = a2 ;
 }
I32 Path_getIndex(Path *self) { return self -> currentIndex ;
 }
U0 Path_setIndex(Path *self,I32 a2) { self -> currentIndex = a2 ;
 }
U0 Path_next(Path *self) { ++ self -> currentIndex ;
 }
Bool Path_isDone(Path *self) { return self -> currentIndex >= self -> size ;
 }


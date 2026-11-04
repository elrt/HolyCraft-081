// Batch 004. Source: minecraftpe/impl/entity/path/Node.cpp
U32 Node_createHash(I32 x,I32 y,I32 z) {
I32 v3 ;
 U32 v4 ;
 I32 v5 ;
 I32 v6 ;
 v3 = x & 0x7FFF ;
 v4 = x & 0x80000000 ;
 v5 = (y)(U8) | ( v3 << 8 ) | ( z << 24 ) ;
 if ( z >= 0 ) {
 v6 = 0 ;
 
}
 else {
 v6 = 0x8000 ;
 
}
 return v4 | v5 | v6 ;

}
U0 Node__init(Node *self) {
self -> nodePositionInHeapMaybe = - 1 ;
 self -> field_24 = 0 ;
 self -> field_20 = 0 ;

}
U0 Node_Init(Node *self,I32 x,I32 y,I32 z) {
memset ( self , 0 , sizeof ( Node ) ) ;
 self -> xCoord = x ;
 self -> yCoord = y ;
 self -> zCoord = z ;
 self -> nodeHash = Node_createHash ( x , y , z ) ;
 Node__init ( self ) ;

}
F32 Node_distanceTo(Node *self,Node *a2) {
F32 v2 ;
 F32 v3 ;
 v2 = ((a2 -> yCoord - self -> yCoord))(F32) ;
 v3 = ((a2 -> zCoord - self -> zCoord))(F32) ;
 return sqrt ( ((((((v2 * v2))(F32) + ((((a2 -> xCoord - self -> xCoord))(F32) * ((a2 -> xCoord - self -> xCoord))(F32)))(F32)))(F32) + ((v3 * v3))(F32)))(F32) ) ;

}
Bool Node_equals(Node *self,Node *a2) {
if ( self -> nodeHash == a2 -> nodeHash && self -> xCoord == a2 -> xCoord && self -> yCoord == a2 -> yCoord ) {
 return self -> zCoord - a2 -> zCoord + ( self -> zCoord == a2 -> zCoord ) + a2 -> zCoord - self -> zCoord ;
 
}
 else {
 return 0 ;
 
}

}
I32 Node_hashCode(Node *self) {
return self -> nodeHash ;

}
Bool Node_inOpenSet(Node *self) {
return self -> nodePositionInHeapMaybe >= 0 ;

}


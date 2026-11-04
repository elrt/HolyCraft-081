// Batch 004. Source: minecraftpe/impl/entity/path/BinaryHeap.cpp
U0 BinaryHeap__init(BinaryHeap *self) {
MCNodeArray arr ;
 arr. size = 1024 ;
 arr. array = MC_Alloc ( 1024 * sizeof ( Node * ) ) ;
 memset ( arr. array , 0 , 1024 * sizeof ( Node * ) ) ;
 self -> array = arr ;
 self -> _size = 0 ;

}
U0 BinaryHeap_Init(BinaryHeap *self) {
BinaryHeap__init ( self ) ;

}
U0 BinaryHeap_Destroy(BinaryHeap *self) {
if ( self -> array. array ) free ( self -> array. array ) ;

}
U0 BinaryHeap_clear(BinaryHeap *self) {
self -> _size = 0 ;

}
Node* BinaryHeap_peek(BinaryHeap *self) {
return * self -> array. array ;

}
I32 BinaryHeap_size(BinaryHeap *self) {
return self -> _size ;

}
U0 BinaryHeap_upHeap(BinaryHeap *self,I32 a2) {
Node * v2 ;
 F32 nodeCost ;
 Node * v4 ;
 v2 = self -> array. array [ a2 ] ;
 nodeCost = v2 -> nodeCost ;
 while ( a2 > 0 ) {
 v4 = self -> array. array [ ( a2 - 1 ) >> 1 ] ;
 if ( nodeCost >= v4 -> nodeCost ) {
 break ;
 
}
 self -> array. array [ a2 ] = v4 ;
 v4 -> nodePositionInHeapMaybe = a2 ;
 a2 = ( a2 - 1 ) >> 1 ;
 
}
 self -> array. array [ a2 ] = v2 ;
 v2 -> nodePositionInHeapMaybe = a2 ;

}
U0 BinaryHeap_insert(BinaryHeap *self,Node *a2) {
I32 size ;
 I32 v6 ;
 Node * * v7 ;
 I32 i ;
 I32 v9 ;
 size = self -> _size ;
 if ( size == self -> array. size ) {
 v6 = 2 * size ;
 v7 = MC_Alloc ( v6 * sizeof ( Node * ) ) ;
 memset ( v7 , 0 , v6 * sizeof ( Node * ) ) ;
 for ( i = 0 ;
 i < self -> _size ;
 ++ i ) {
 v7 [ i ] = self -> array. array [ i ] ;
 
}
 if ( self -> array. array ) {
 free ( self -> array. array ) ;
 
}
 self -> array. array = v7 ;
 self -> array. size = v6 ;
 
}
 self -> array. array [ self -> _size ] = a2 ;
 a2 -> nodePositionInHeapMaybe = self -> _size ;
 v9 = self -> _size ;
 self -> _size = v9 + 1 ;
 BinaryHeap_upHeap ( self , v9 ) ;

}
U0 BinaryHeap_downHeap(BinaryHeap *self,I32 a2) {
Node * v2 ;
 F32 nodeCost ;
 I32 size ;
 I32 v5 ;
 I32 v6 ;
 Node * * array ;
 F32 v8 ;
 Node * v9 ;
 Node * v10 ;
 F32 v11 ;
 v2 = self -> array. array [ a2 ] ;
 nodeCost = v2 -> nodeCost ;
 while ( 1 ) {
 size = self -> _size ;
 v5 = 2 * a2 + 1 ;
 v6 = 2 * a2 + 2 ;
 if ( v5 >= size ) {
 break ;
 
}
 array = self -> array. array ;
 if ( v6 < size ) {
 v9 = array [ v6 ] ;
 v8 = v9 -> nodeCost ;
 
}
 else {
 v8 = 340282346638528859811704183484516925440.0 ;
 v9 = 0 ;
 
}
 v10 = array [ v5 ] ;
 v11 = v10 -> nodeCost ;
 if ( v11 >= v8 ) {
 if ( v8 >= nodeCost ) {
 break ;
 
}
 array [ a2 ] = v9 ;
 v9 -> nodePositionInHeapMaybe = a2 ;
 a2 = 2 * a2 + 2 ;
 
}
 else {
 if ( v11 >= nodeCost ) {
 break ;
 
}
 array [ a2 ] = v10 ;
 v10 -> nodePositionInHeapMaybe = a2 ;
 a2 = 2 * a2 + 1 ;
 
}
 
}
 self -> array. array [ a2 ] = v2 ;
 v2 -> nodePositionInHeapMaybe = a2 ;

}
U0 BinaryHeap_changeCost(BinaryHeap *self,Node *a2,F32 a3) {
F32 nodeCost ;
 I32 nodePositionInHeapMaybe ;
 nodeCost = a2 -> nodeCost ;
 a2 -> nodeCost = a3 ;
 nodePositionInHeapMaybe = a2 -> nodePositionInHeapMaybe ;
 if ( a3 >= nodeCost ) {
 BinaryHeap_downHeap ( self , nodePositionInHeapMaybe ) ;
 
}
 else {
 BinaryHeap_upHeap ( self , nodePositionInHeapMaybe ) ;
 
}

}
U0 BinaryHeap_remove(BinaryHeap *self,Node *a2) {
I32 nodePositionInHeapMaybe ;
 Node * * array ;
 I32 v5 ;
 I32 v6 ;
 nodePositionInHeapMaybe = a2 -> nodePositionInHeapMaybe ;
 array = self -> array. array ;
 v5 = self -> _size - 1 ;
 self -> _size = v5 ;
 array [ nodePositionInHeapMaybe ] = array [ v5 ] ;
 self -> array. array [ self -> _size ] = 0 ;
 v6 = a2 -> nodePositionInHeapMaybe ;
 if ( self -> _size > v6 ) {
 if ( self -> array. array [ v6 ] -> nodeCost >= a2 -> nodeCost ) {
 BinaryHeap_downHeap ( self , v6 ) ;
 
}
 else {
 BinaryHeap_upHeap ( self , v6 ) ;
 
}
 
}
 a2 -> nodePositionInHeapMaybe = - 1 ;

}
Node* BinaryHeap_pop(BinaryHeap *self) {
Node * * array ;
 I32 v2 ;
 Node * v3 ;
 Node * result ;
 array = self -> array. array ;
 v2 = self -> _size - 1 ;
 v3 = * self -> array. array ;
 self -> _size = v2 ;
 * array = array [ v2 ] ;
 self -> array. array [ self -> _size ] = 0 ;
 if ( self -> _size > 0 ) {
 BinaryHeap_downHeap ( self , 0 ) ;
 
}
 result = v3 ;
 v3 -> nodePositionInHeapMaybe = - 1 ;
 return result ;

}
Bool BinaryHeap_isEmpty(BinaryHeap *self) {
return self -> _size == 0 ;

}


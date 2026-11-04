// Batch 004. Source: minecraftpe/headers/entity/path/BinaryHeap.hpp
#ifndef MCPE_HEADERS_ENTITY_PATH_BINARYHEAP_HPP
#define MCPE_HEADERS_ENTITY_PATH_BINARYHEAP_HPP
class MCNodeArray { Node **array; I32 size; };
class BinaryHeap { MCNodeArray array; I32 _size; };
U0 BinaryHeap__init(BinaryHeap *self);
U0 BinaryHeap_Init(BinaryHeap *self);
U0 BinaryHeap_Destroy(BinaryHeap *self);
U0 BinaryHeap_clear(BinaryHeap *self);
Node* BinaryHeap_peek(BinaryHeap *self);
I32 BinaryHeap_size(BinaryHeap *self);
U0 BinaryHeap_upHeap(BinaryHeap *self,I32 a2);
U0 BinaryHeap_insert(BinaryHeap *self,Node *a2);
U0 BinaryHeap_downHeap(BinaryHeap *self,I32 a2);
U0 BinaryHeap_changeCost(BinaryHeap *self,Node *a2,F32 a3);
U0 BinaryHeap_remove(BinaryHeap *self,Node *a2);
Node* BinaryHeap_pop(BinaryHeap *self);
Bool BinaryHeap_isEmpty(BinaryHeap *self);

#endif


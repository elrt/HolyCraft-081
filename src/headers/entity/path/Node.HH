// Batch 004. Source: minecraftpe/headers/entity/path/Node.hpp
#ifndef MCPE_HEADERS_ENTITY_PATH_NODE_HPP
#define MCPE_HEADERS_ENTITY_PATH_NODE_HPP
class Node { I32 xCoord,yCoord,zCoord,nodeHash,nodePositionInHeapMaybe; F32 field_14,field_18,nodeCost; Node *field_20; I8 field_24,field_25,field_26,field_27; };
U32 Node_createHash(I32 x,I32 y,I32 z);
U0 Node__init(Node *self);
U0 Node_Init(Node *self,I32 x,I32 y,I32 z);
F32 Node_distanceTo(Node *self,Node *a2);
Bool Node_equals(Node *self,Node *a2);
I32 Node_hashCode(Node *self);
Bool Node_inOpenSet(Node *self);

#endif


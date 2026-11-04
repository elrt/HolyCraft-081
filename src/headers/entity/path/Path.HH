// Batch 004. Source: minecraftpe/headers/entity/path/Path.hpp
#ifndef MCPE_HEADERS_ENTITY_PATH_PATH_HPP
#define MCPE_HEADERS_ENTITY_PATH_PATH_HPP
class Path { Node **nodes; I32 pathSize,currentIndex,size; };
U0 Path_Init(Path *self,Node **nodes,I32 size);
U0 Path_Destroy(Path *self);
U0 Path_getPos(Path *self,F32 entityWidth,I32 index,Vec3 *out);
U0 Path_currentPos(Path *self,Vec3 *out);
U0 Path_currentPosForWidth(Path *self,F32 entityWidth,Vec3 *out);
Bool Path_sameAs(Path *self,Path *other);
Bool Path_endsIn(Path *self,Vec3 *v);
Bool Path_endsInXZ(Path *self,Vec3 *v);
Node *Path_last(Path *self);
Node *Path_get(Path *self,I32 index);
I32 Path_getSize(Path *self);
U0 Path_setSize(Path *self,I32 n);
I32 Path_getIndex(Path *self);
U0 Path_setIndex(Path *self,I32 n);
U0 Path_next(Path *self);
Bool Path_isDone(Path *self);

#endif


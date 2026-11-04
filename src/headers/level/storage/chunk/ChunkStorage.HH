// Batch 003. Source: minecraftpe/headers/level/storage/chunk/ChunkStorage.hpp
#ifndef MCPE_HEADERS_LEVEL_STORAGE_CHUNK_CHUNKSTORAGE_HPP
#define MCPE_HEADERS_LEVEL_STORAGE_CHUNK_CHUNKSTORAGE_HPP
class ChunkStorage { U0 *context; U0 *(*loadFn)(ChunkStorage *self,U0 *level,I32 x,I32 z);U0 (*saveFn)(ChunkStorage *self,U0 *level,U0 *chunk);U0 (*entitiesFn)(ChunkStorage *self,U0 *level,U0 *chunk);U0 (*tickFn)(ChunkStorage *self);U0 (*flushFn)(ChunkStorage *self);U0 (*destroyFn)(ChunkStorage *self); };
U0 *ChunkStorage_DefaultLoad(ChunkStorage *self,U0 *level,I32 x,I32 z) { return NULL; }
U0 ChunkStorage_DefaultSave(ChunkStorage *self,U0 *level,U0 *chunk) {}
U0 ChunkStorage_DefaultVoid(ChunkStorage *self) {}
U0 ChunkStorage_Init(ChunkStorage *self) { self->context=NULL;self->loadFn=&ChunkStorage_DefaultLoad;self->saveFn=&ChunkStorage_DefaultSave;self->entitiesFn=&ChunkStorage_DefaultSave;self->tickFn=&ChunkStorage_DefaultVoid;self->flushFn=&ChunkStorage_DefaultVoid;self->destroyFn=&ChunkStorage_DefaultVoid; }
U0 *ChunkStorage_load(ChunkStorage *self,U0 *level,I32 x,I32 z) { return self->loadFn(self,level,x,z); }
U0 ChunkStorage_save(ChunkStorage *self,U0 *level,U0 *chunk) { self->saveFn(self,level,chunk); }
U0 ChunkStorage_saveEntities(ChunkStorage *self,U0 *level,U0 *chunk) { self->entitiesFn(self,level,chunk); }
U0 ChunkStorage_saveAll(ChunkStorage *self,U0 *level,MCPtrVector *chunks) { I64 i;for(i=0;i<chunks->size;i++)self->saveFn(self,level,chunks->data[i]); }
U0 ChunkStorage_tick(ChunkStorage *self) { self->tickFn(self); }
U0 ChunkStorage_flush(ChunkStorage *self) { self->flushFn(self); }
U0 ChunkStorage_Destroy(ChunkStorage *self) { self->destroyFn(self); }

#endif


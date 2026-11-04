// Batch 003. Source: minecraftpe/headers/level/storage/MemoryLevelStorage.hpp
#ifndef MCPE_HEADERS_LEVEL_STORAGE_MEMORYLEVELSTORAGE_HPP
#define MCPE_HEADERS_LEVEL_STORAGE_MEMORYLEVELSTORAGE_HPP
class MemoryLevelStorage : LevelStorage { ChunkStorage *chunkStorage; };
U0 *MemoryLevelStorage_Prepare(LevelStorage *base,U0 *level) { return NULL; }
ChunkStorage *MemoryLevelStorage_Create(LevelStorage *base,U0 *dimension) { MemoryLevelStorage *self=base;MemoryChunkStorage *storage=MC_Alloc(sizeof(MemoryChunkStorage));MemoryChunkStorage_Init(storage);self->chunkStorage=storage;return storage; }
U0 MemoryLevelStorage_SaveData(LevelStorage *base,U0 *data,MCPtrVector *players) {}
U0 MemoryLevelStorage_Close(LevelStorage *base) {}
U0 MemoryLevelStorage_Destroy(LevelStorage *base) { MemoryLevelStorage *self=base;if(self->chunkStorage){ChunkStorage_Destroy(self->chunkStorage);free(self->chunkStorage);self->chunkStorage=NULL;} }
U0 MemoryLevelStorage_Init(MemoryLevelStorage *self,ChunkStorage *storage=NULL) { LevelStorage_Init(self);self->chunkStorage=storage;self->prepareFn=&MemoryLevelStorage_Prepare;self->createFn=&MemoryLevelStorage_Create;self->saveDataFn=&MemoryLevelStorage_SaveData;self->closeFn=&MemoryLevelStorage_Close;self->destroyFn=&MemoryLevelStorage_Destroy; }

#endif


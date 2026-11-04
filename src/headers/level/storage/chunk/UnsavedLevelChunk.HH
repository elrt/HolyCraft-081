// Batch 003. Source: minecraftpe/headers/level/storage/chunk/UnsavedLevelChunk.hpp
#ifndef MCPE_HEADERS_LEVEL_STORAGE_CHUNK_UNSAVEDLEVELCHUNK_HPP
#define MCPE_HEADERS_LEVEL_STORAGE_CHUNK_UNSAVEDLEVELCHUNK_HPP
class UnsavedLevelChunk { I32 index,timeMs;U0 *chunk; };
U0 UnsavedLevelChunk_Init(UnsavedLevelChunk *self,I32 index,I32 timeMs,U0 *chunk) { self->index=index;self->timeMs=timeMs;self->chunk=chunk; }

#endif


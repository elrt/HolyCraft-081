// Batch 003. Source: minecraftpe/headers/level/storage/LevelStorage.hpp
#ifndef MCPE_HEADERS_LEVEL_STORAGE_LEVELSTORAGE_HPP
#define MCPE_HEADERS_LEVEL_STORAGE_LEVELSTORAGE_HPP
class LevelStorage { U0 *(*prepareFn)(LevelStorage *self,U0 *level);ChunkStorage *(*createFn)(LevelStorage *self,U0 *dimension);U0 (*saveDataFn)(LevelStorage *self,U0 *data,MCPtrVector *players);Bool (*loadPlayerFn)(LevelStorage *self,U0 *player);Bool (*savePlayerFn)(LevelStorage *self,U0 *player);U0 (*closeFn)(LevelStorage *self);U0 (*saveGameFn)(LevelStorage *self,U0 *level);U0 (*loadEntitiesFn)(LevelStorage *self,U0 *level,U0 *chunk);U0 (*destroyFn)(LevelStorage *self); };
Bool LevelStorage_DefaultPlayer(LevelStorage *self,U0 *player) { return FALSE; }
U0 LevelStorage_DefaultSaveGame(LevelStorage *self,U0 *level) {}
U0 LevelStorage_DefaultEntities(LevelStorage *self,U0 *level,U0 *chunk) {}
U0 LevelStorage_DefaultDestroy(LevelStorage *self) {}
U0 LevelStorage_Init(LevelStorage *self) { memset(self,0,sizeof(LevelStorage));self->loadPlayerFn=&LevelStorage_DefaultPlayer;self->savePlayerFn=&LevelStorage_DefaultPlayer;self->saveGameFn=&LevelStorage_DefaultSaveGame;self->loadEntitiesFn=&LevelStorage_DefaultEntities;self->destroyFn=&LevelStorage_DefaultDestroy; }
U0 *LevelStorage_prepareLevel(LevelStorage *self,U0 *level) { if(!self->prepareFn)exit(90);return self->prepareFn(self,level); }
ChunkStorage *LevelStorage_createChunkStorage(LevelStorage *self,U0 *dimension) { if(!self->createFn)exit(90);return self->createFn(self,dimension); }
U0 LevelStorage_saveLevelData(LevelStorage *self,U0 *data,MCPtrVector *players=NULL) { if(!self->saveDataFn)exit(90);self->saveDataFn(self,data,players); }
Bool LevelStorage_load(LevelStorage *self,U0 *player) { return self->loadPlayerFn(self,player); }
Bool LevelStorage_save(LevelStorage *self,U0 *player) { return self->savePlayerFn(self,player); }
U0 LevelStorage_closeAll(LevelStorage *self) { if(!self->closeFn)exit(90);self->closeFn(self); }
U0 LevelStorage_saveGame(LevelStorage *self,U0 *level) { self->saveGameFn(self,level); }
U0 LevelStorage_loadEntities(LevelStorage *self,U0 *level,U0 *chunk) { self->loadEntitiesFn(self,level,chunk); }
U0 LevelStorage_Destroy(LevelStorage *self) { self->destroyFn(self); }

#endif


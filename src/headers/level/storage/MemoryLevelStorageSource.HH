// Batch 003. Source: minecraftpe/headers/level/storage/MemoryLevelStorageSource.hpp
#ifndef MCPE_HEADERS_LEVEL_STORAGE_MEMORYLEVELSTORAGESOURCE_HPP
#define MCPE_HEADERS_LEVEL_STORAGE_MEMORYLEVELSTORAGESOURCE_HPP
class MemoryLevelStorageSource : LevelStorageSource {};
U0 MemoryLevelStorageSource_Name(LevelStorageSource *self,MCString *out) { MCString_FromC(out,"Memory Storage"); }
I32 MemoryLevelStorageSource_Data(LevelStorageSource *self,MCString *id) { return 0; }
LevelStorage *MemoryLevelStorageSource_Select(LevelStorageSource *self,MCString *id,Bool create) { MemoryLevelStorage *storage=MC_Alloc(sizeof(MemoryLevelStorage));MemoryLevelStorage_Init(storage);return storage; }
Bool MemoryLevelStorageSource_True(LevelStorageSource *self,MCString *id) { return TRUE; }
Bool MemoryLevelStorageSource_False(LevelStorageSource *self,MCString *id) { return FALSE; }
Bool MemoryLevelStorageSource_Convert(LevelStorageSource *self,MCString *id,U0 *progress) { return FALSE; }
U0 MemoryLevelStorageSource_Delete(LevelStorageSource *self,MCString *id) {}
U0 MemoryLevelStorageSource_Rename(LevelStorageSource *self,MCString *id,MCString *name) {}
U0 MemoryLevelStorageSource_Init(MemoryLevelStorageSource *self) { LevelStorageSource_Init(self);self->nameFn=&MemoryLevelStorageSource_Name;self->dataFn=&MemoryLevelStorageSource_Data;self->selectFn=&MemoryLevelStorageSource_Select;self->acceptableFn=&MemoryLevelStorageSource_True;self->clearFn=&LevelStorageSource_DefaultVoid;self->deleteFn=&MemoryLevelStorageSource_Delete;self->renameFn=&MemoryLevelStorageSource_Rename;self->convertibleFn=&MemoryLevelStorageSource_False;self->requiresFn=&MemoryLevelStorageSource_False;self->convertFn=&MemoryLevelStorageSource_Convert; }

#endif


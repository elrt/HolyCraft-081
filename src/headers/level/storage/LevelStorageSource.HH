// Batch 003. Source: minecraftpe/headers/level/storage/LevelStorageSource.hpp
#ifndef MCPE_HEADERS_LEVEL_STORAGE_LEVELSTORAGESOURCE_HPP
#define MCPE_HEADERS_LEVEL_STORAGE_LEVELSTORAGESOURCE_HPP
class LevelStorageSource {
 U0 (*nameFn)(LevelStorageSource *self,MCString *out);U0 (*listFn)(LevelStorageSource *self,MCVector *out);
 I32 (*dataFn)(LevelStorageSource *self,MCString *id);LevelStorage *(*selectFn)(LevelStorageSource *self,MCString *id,Bool create);
 Bool (*acceptableFn)(LevelStorageSource *self,MCString *id);U0 (*clearFn)(LevelStorageSource *self);U0 (*deleteFn)(LevelStorageSource *self,MCString *id);U0 (*renameFn)(LevelStorageSource *self,MCString *id,MCString *name);
 Bool (*convertibleFn)(LevelStorageSource *self,MCString *id);Bool (*requiresFn)(LevelStorageSource *self,MCString *id);Bool (*convertFn)(LevelStorageSource *self,MCString *id,U0 *progress);
 U0 (*storeFn)(LevelStorageSource *self,U0 *data,MCString *id);U0 (*loadFn)(LevelStorageSource *self,U0 *data,MCString *id);U0 (*clearCacheFn)(LevelStorageSource *self);U0 (*destroyFn)(LevelStorageSource *self);
};
extern MCString LevelStorageSource_TempLevelId;
U0 LevelStorageSource_DefaultList(LevelStorageSource *self,MCVector *out) {}
U0 LevelStorageSource_DefaultCache(LevelStorageSource *self,U0 *data,MCString *id) {}
U0 LevelStorageSource_DefaultVoid(LevelStorageSource *self) {}
U0 LevelStorageSource_Init(LevelStorageSource *self) { memset(self,0,sizeof(LevelStorageSource));self->listFn=&LevelStorageSource_DefaultList;self->storeFn=&LevelStorageSource_DefaultCache;self->loadFn=&LevelStorageSource_DefaultCache;self->clearCacheFn=&LevelStorageSource_DefaultVoid;self->destroyFn=&LevelStorageSource_DefaultVoid; }
U0 LevelStorageSource_getName(LevelStorageSource *self,MCString *out) { if(!self->nameFn)exit(91);self->nameFn(self,out); }
U0 LevelStorageSource_getLevelList(LevelStorageSource *self,MCVector *out) { if(!self->listFn)exit(91);self->listFn(self,out); }
I32 LevelStorageSource_getDataTagFor(LevelStorageSource *self,MCString *id) { if(!self->dataFn)exit(91);return self->dataFn(self,id); }
LevelStorage * LevelStorageSource_selectLevel(LevelStorageSource *self,MCString *id,Bool create) { if(!self->selectFn)exit(91);return self->selectFn(self,id,create); }
Bool LevelStorageSource_isNewLevelIdAcceptable(LevelStorageSource *self,MCString *id) { if(!self->acceptableFn)exit(91);return self->acceptableFn(self,id); }
U0 LevelStorageSource_clearAll(LevelStorageSource *self) { if(!self->clearFn)exit(91);self->clearFn(self); }
U0 LevelStorageSource_deleteLevel(LevelStorageSource *self,MCString *id) { if(!self->deleteFn)exit(91);self->deleteFn(self,id); }
U0 LevelStorageSource_renameLevel(LevelStorageSource *self,MCString *id,MCString *name) { if(!self->renameFn)exit(91);self->renameFn(self,id,name); }
Bool LevelStorageSource_isConvertible(LevelStorageSource *self,MCString *id) { if(!self->convertibleFn)exit(91);return self->convertibleFn(self,id); }
Bool LevelStorageSource_requiresConversion(LevelStorageSource *self,MCString *id) { if(!self->requiresFn)exit(91);return self->requiresFn(self,id); }
Bool LevelStorageSource_convertLevel(LevelStorageSource *self,MCString *id,U0 *progress) { if(!self->convertFn)exit(91);return self->convertFn(self,id,progress); }
U0 LevelStorageSource_storeToCache(LevelStorageSource *self,U0 *data,MCString *id) { if(!self->storeFn)exit(91);self->storeFn(self,data,id); }
U0 LevelStorageSource_loadFromCache(LevelStorageSource *self,U0 *data,MCString *id) { if(!self->loadFn)exit(91);self->loadFn(self,data,id); }
U0 LevelStorageSource_clearCache(LevelStorageSource *self) { if(!self->clearCacheFn)exit(91);self->clearCacheFn(self); }
U0 LevelStorageSource_Destroy(LevelStorageSource *self) { if(!self->destroyFn)exit(91);self->destroyFn(self); }

#endif


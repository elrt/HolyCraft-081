// Batch 002. Source: minecraftpe/headers/level/LevelSummary.hpp
#ifndef MCPE_HEADERS_LEVEL_LEVELSUMMARY_HPP
#define MCPE_HEADERS_LEVEL_LEVELSUMMARY_HPP
class LevelSummary { MCString levelDir,levelName; I32 lastPlayed,gamemode,seed,sizeOnDisk; };
U0 LevelSummary_Init(LevelSummary *self) { MCString_Init(&self->levelDir); MCString_Init(&self->levelName); }
U0 LevelSummary_Destroy(LevelSummary *self) { MCString_Destroy(&self->levelDir); MCString_Destroy(&self->levelName); }
Bool LevelSummary_Less(LevelSummary *self,LevelSummary *other) { return self->lastPlayed>other->lastPlayed; }
U0 LevelSummary_CopyInit(LevelSummary *self,LevelSummary *other) {
 MCString_CopyInit(&self->levelDir,&other->levelDir); MCString_CopyInit(&self->levelName,&other->levelName);
 self->lastPlayed=other->lastPlayed; self->gamemode=other->gamemode; self->seed=other->seed; self->sizeOnDisk=other->sizeOnDisk;
}
U0 LevelSummary_MoveInit(LevelSummary *self,LevelSummary *other) {
 MCString_MoveInit(&self->levelDir,&other->levelDir); MCString_MoveInit(&self->levelName,&other->levelName);
 self->lastPlayed=other->lastPlayed; self->gamemode=other->gamemode; self->seed=other->seed; self->sizeOnDisk=other->sizeOnDisk;
}
LevelSummary *LevelSummary_Assign(LevelSummary *self,LevelSummary *other) {
 MCString_Assign(&self->levelDir,&other->levelDir); MCString_Assign(&self->levelName,&other->levelName);
 self->lastPlayed=other->lastPlayed; self->gamemode=other->gamemode; self->seed=other->seed; self->sizeOnDisk=other->sizeOnDisk; return self;
}
LevelSummary *LevelSummary_MoveAssign(LevelSummary *self,LevelSummary *other) { if(self!=other) { LevelSummary_Destroy(self); LevelSummary_MoveInit(self,other); } return self; }

#endif


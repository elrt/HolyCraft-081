// Batch 005. Source: minecraftpe/headers/sound/SoundRepository.hpp
#ifndef MCPE_HEADERS_SOUND_SOUNDREPOSITORY_HPP
#define MCPE_HEADERS_SOUND_SOUNDREPOSITORY_HPP
class MCSoundEntry { MCString name;MCVector sounds; };
class SoundRepository { MCPtrVector sounds; };
U0 SoundRepository_Init(SoundRepository *self) { MCPtrVector_Init(&self->sounds); }
MCSoundEntry *SoundRepository_Find(SoundRepository *self,MCString *name) { I64 i;MCSoundEntry *entry;for(i=0;i<self->sounds.size;i++) { entry=self->sounds.data[i];if(MCString_Equal(&entry->name,name))return entry; }return NULL; }
U0 SoundRepository_addConst(SoundRepository *self,MCString *name,SoundDesc *sound) { if(!sound->pcmData)return;MCSoundEntry *entry=SoundRepository_Find(self,name);if(!entry) { entry=MC_Alloc(sizeof(MCSoundEntry));MCString_CopyInit(&entry->name,name);MCVector_Init(&entry->sounds,sizeof(SoundDesc));MCPtrVector_Push(&self->sounds,entry); }SoundDesc copy;SoundDesc_CopyInit(&copy,sound);MCVector_Push(&entry->sounds,&copy); }
U0 SoundRepository_add(SoundRepository *self,MCString *name,SoundDesc *sound) { if(!sound->pcmData)return;SoundRepository_addConst(self,name,sound);MCString_Assign(&sound->field_18,name); }
Bool SoundRepository_get(SoundRepository *self,MCString *name,SoundDesc *out) { MCSoundEntry *entry=SoundRepository_Find(self,name);if(!entry)return FALSE;I32 idx=Mth_randomBound(entry->sounds.size);SoundDesc_Assign(out,MCVector_At(&entry->sounds,idx));return TRUE; }
U0 SoundRepository_Destroy(SoundRepository *self) { I64 i,j;MCSoundEntry *entry;for(i=0;i<self->sounds.size;i++) { entry=self->sounds.data[i];for(j=0;j<entry->sounds.size;j++)SoundDesc_Destroy(MCVector_At(&entry->sounds,j));MCVector_Destroy(&entry->sounds);MCString_Destroy(&entry->name);free(entry); }MCPtrVector_Destroy(&self->sounds); }

#endif


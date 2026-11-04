// Batch 004. Source: minecraftpe/headers/ExternalServerFile.hpp
#ifndef MCPE_HEADERS_EXTERNALSERVERFILE_HPP
#define MCPE_HEADERS_EXTERNALSERVERFILE_HPP
class ExternalServerFile { MCVector servers; MCString fileName; };
U0 ExternalServerFile_Init(ExternalServerFile *self,MCString *directory);
ExternalServer *ExternalServerFile_Find(ExternalServerFile *self,I32 id);
MCVector *ExternalServerFile_getExternalServers(ExternalServerFile *self);
U0 ExternalServerFile_save(ExternalServerFile *self); U0 ExternalServerFile_load(ExternalServerFile *self);
U0 ExternalServerFile_addServer(ExternalServerFile *self,MCString *name,MCString *ip,I32 port);
U0 ExternalServerFile_editServer(ExternalServerFile *self,I32 id,MCString *name,MCString *ip,I32 port);
U0 ExternalServerFile_removeSevrer(ExternalServerFile *self,I32 id);
U0 ExternalServerFile_Destroy(ExternalServerFile *self);

#endif


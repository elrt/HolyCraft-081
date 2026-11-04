// Batch 003. Source: minecraftpe/headers/fileutil.hpp
#ifndef MCPE_HEADERS_FILEUTIL_HPP
#define MCPE_HEADERS_FILEUTIL_HPP
#include "../../runtime/Batch003FileABI.HH"
I32 FileUtil_mkdir(U8 *path) { return mkdir(path,493); }
I32 FileUtil_access(U8 *path,I32 mode) { return access(path,mode); }
I32 FileUtil_errno() { I32 *value=__errno_location();return *value; }
Bool FileUtil_exists(U8 *path) { return access(path,0)==0; }
Bool FileUtil_createFolderIfNotExists(U8 *path) { return FileUtil_exists(path) || FileUtil_mkdir(path)==0; }
I32 FileUtil_getRemainingFileSize(U0 *file) { if(!file)return 0;I32 cur=ftell(file);fseek(file,0,2);I32 end=ftell(file);fseek(file,cur,0);return end-cur; }
I32 FileUtil_getFileSize(U8 *path) { U0 *file=fopen(path,"rb");if(!file)return -1;fseek(file,0,2);I32 size=ftell(file);fclose(file);return size; }
Bool FileUtil_createTree(U8 *path,U8 **suffixes,I32 count) { if(!FileUtil_createFolderIfNotExists(path))return FALSE;MCString value;MCString_FromC(&value,path);I32 i;for(i=0;i<count;i++){I64 n=MC_StrLen(suffixes[i]);U8 *data=MC_Alloc(value.size+n+1);memcpy(data,value.data,value.size);memcpy(data+value.size,suffixes[i],n+1);free(value.data);value.data=data;value.size+=n;if(!FileUtil_createFolderIfNotExists(data)){MCString_Destroy(&value);return FALSE;}}MCString_Destroy(&value);return TRUE; }

#endif


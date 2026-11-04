// Batch 004. Source: minecraftpe/impl/cpputils.cpp
F64 getTimeS() { return MC_GetTimeS(); }
I64 getEpochTimeS() { return time(NULL); }
I32 getTimeMs() { return getTimeS()*1000; }
I32 getRawTimeS() { MCTimeval v;gettimeofday(&v,NULL);return v.tv_sec; }
U0 sleepMs(I32 milliseconds) { usleep(milliseconds*1000); }
F32 vcvts_n_f32_s32(I32 value,U32 shift) { F32 v=value;return v/(1<<shift); }
U0 splitString(MCString *text,U8 delimiter,MCVector *out) { I64 start=0,i;MCString part;for(i=0;i<text->size;i++)if(text->data[i]==delimiter) { MCString_FromBytes(&part,text->data+start,i-start);MCStringVector_Push(out,&part);MCString_Destroy(&part);start=i+1; }if(start<text->size) { MCString_FromBytes(&part,text->data+start,text->size-start);MCStringVector_Push(out,&part);MCString_Destroy(&part); } }
I32 recursiveDelete(U8 *path) { U0 *dir=opendir(path);MCNativeDirent *entry;I32 ret;U8 next[2048];if(dir) { while(TRUE) { entry=readdir(dir);if(!entry)break;if(strcmp(entry->name,".")==0 || strcmp(entry->name,"..")==0)continue;ret=snprintf(next,2048,"%s/%s",path,entry->name);if(ret<0 || ret>=2048) { closedir(dir);return -1; }if(entry->type==4)ret=recursiveDelete(next);else ret=remove(next);if(ret) { closedir(dir);return ret; } }closedir(dir); }return remove(path); }
Bool DeleteDirectory(MCString *path,Bool unused) { return recursiveDelete(MCString_CStr(path))==0; }
U0 safeRemove(U0 **pointer,U0 (*destroy)(U0 *object)) { if(*pointer) { if(destroy)destroy(*pointer);free(*pointer);*pointer=NULL; } }
U0 safeStopAndRemove(U0 **pointer,U0 (*stop)(U0 *object),U0 (*release)(U0 *object)) { if(*pointer) { if(stop)stop(*pointer);if(release)release(*pointer);*pointer=NULL; } }


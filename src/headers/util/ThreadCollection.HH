// Batch 005. Source: minecraftpe/headers/util/ThreadCollection.hpp
#ifndef MCPE_HEADERS_UTIL_THREADCOLLECTION_HPP
#define MCPE_HEADERS_UTIL_THREADCOLLECTION_HPP
class ThreadCollection { MCPtrVector threads,workers,field_C,field_34;MCNativeMutex mutex,field_60;MCNativeCond field_64;Bool isStopped; };
U0 ThreadCollection_Init(ThreadCollection *self,U32 maxthreads);
Bool ThreadCollection_enqueue(ThreadCollection *self,Job *job);
U0 ThreadCollection_processUIThread(ThreadCollection *self);
U0 ThreadCollection_Destroy(ThreadCollection *self);

#endif


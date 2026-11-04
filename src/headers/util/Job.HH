// Batch 005. Source: minecraftpe/headers/util/Job.hpp
#ifndef MCPE_HEADERS_UTIL_JOB_HPP
#define MCPE_HEADERS_UTIL_JOB_HPP
#include "../../../runtime/Batch005ThreadSupport.HH"
class ThreadCollection;
class Job { I32 status,field_4;U0 *context;U0 (*stopFn)(Job *self);U0 (*runFn)(Job *self);U0 (*finishFn)(Job *self);U0 (*destroyFn)(Job *self);I32 references;MCNativeMutex lock; };
U0 Job_Init(Job *self);
U0 Job_Retain(Job *self);U0 Job_Release(Job *self);
I32 Job_getStatus(Job *self);I32 Job_trySetStatus(Job *self,I32 value);
U0 Job_stop(Job *self);U0 Job_run(Job *self);U0 Job_finish(Job *self);
U0 Job_addToThreadCollection(Job *self,ThreadCollection *pool);

#endif


// Batch 005. Source: minecraftpe/impl/util/Job.cpp
U0 Job_Init(Job *self) { memset(self,0,sizeof(Job));self->references=1;self->status=JS_0;MCThread_Check(pthread_mutex_init(MC_MutexAddress(&self->lock))); }
U0 Job_Retain(Job *self) { if(!self)return;MCThread_Check(pthread_mutex_lock(MC_MutexAddress(&self->lock)));self->references++;MCThread_Check(pthread_mutex_unlock(MC_MutexAddress(&self->lock))); }
U0 Job_Release(Job *self) { if(!self)return;MCThread_Check(pthread_mutex_lock(MC_MutexAddress(&self->lock)));self->references--;Bool last=self->references==0;MCThread_Check(pthread_mutex_unlock(MC_MutexAddress(&self->lock)));if(last) { if(self->destroyFn)self->destroyFn(self);MCThread_Check(pthread_mutex_destroy(MC_MutexAddress(&self->lock)));free(self); } }
I32 Job_getStatus(Job *self) { MCThread_Check(pthread_mutex_lock(MC_MutexAddress(&self->lock)));I32 status=self->status;MCThread_Check(pthread_mutex_unlock(MC_MutexAddress(&self->lock)));return status; }
I32 Job_trySetStatus(Job *self,I32 value) { MCThread_Check(pthread_mutex_lock(MC_MutexAddress(&self->lock)));if(self->status!=JS_STOPPED)self->status=value;I32 status=self->status;MCThread_Check(pthread_mutex_unlock(MC_MutexAddress(&self->lock)));return status; }
U0 Job_stop(Job *self) { if(!self->stopFn) { printf("Abstract Job.stop\n");exit(88); }self->stopFn(self); }
U0 Job_run(Job *self) { if(!self->runFn) { printf("Abstract Job.run\n");exit(88); }self->runFn(self); }
U0 Job_finish(Job *self) { if(!self->finishFn) { printf("Abstract Job.finish\n");exit(88); }self->finishFn(self); }
U0 Job_addToThreadCollection(Job *self,ThreadCollection *pool) { ThreadCollection_enqueue(pool,self); }


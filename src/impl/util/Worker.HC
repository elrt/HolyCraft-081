// Batch 005. Source: minecraftpe/impl/util/Worker.cpp
U0 Worker_Init(Worker *self,ThreadCollection *pool) { self->threadCollection=pool; }
U0 *Worker_Entry(U0 *arg) { Worker_call(arg(Worker*));return NULL; }
U0 Worker_call(Worker *self) { ThreadCollection *p=self->threadCollection;Job *job;
while(TRUE) { MCThread_Check(pthread_mutex_lock(MC_MutexAddress(&p->mutex)));while(!p->isStopped && !p->field_C.size)MCThread_Check(pthread_cond_wait(MC_CondAddress(&p->field_64),MC_MutexAddress(&p->mutex)));if(p->isStopped) { MCThread_Check(pthread_mutex_unlock(MC_MutexAddress(&p->mutex)));break; }
job=p->field_C.data[0];I64 i;for(i=1;i<p->field_C.size;i++)p->field_C.data[i-1]=p->field_C.data[i];p->field_C.size--;MCThread_Check(pthread_mutex_unlock(MC_MutexAddress(&p->mutex)));
if(job) { Job_run(job);if(Job_getStatus(job)==JS_FINISHED) { MCThread_Check(pthread_mutex_lock(MC_MutexAddress(&p->field_60)));MCPtrVector_Push(&p->field_34,job);MCThread_Check(pthread_mutex_unlock(MC_MutexAddress(&p->field_60))); }else Job_Release(job); }
} }


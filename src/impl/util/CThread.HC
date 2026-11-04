// Batch 004. Source: minecraftpe/impl/util/CThread.cpp
U0 CThread_Init(CThread *self,U0 *(*function)(U0 *args),U0 *args) { self->function=function;self->field_8=0;pthread_attr_init(&self->field_C);pthread_attr_setdetachstate(&self->field_C,1);self->createError=pthread_create(&self->field_8,&self->field_C,function,args); }
I32 CThread_join(CThread *self) { if(self->createError)return self->createError;return pthread_join(self->field_8,NULL); }
I32 CThread_sleep(U32 milliseconds) { return usleep(1000*milliseconds); }
U0 CThread_Destroy(CThread *self) { if(!self->createError)pthread_join(self->field_8,NULL);pthread_attr_destroy(&self->field_C); }


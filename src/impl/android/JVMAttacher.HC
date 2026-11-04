// Batch 019: minecraftpe/impl/android/JVMAttacher.cpp has no runtime statements.
U0 JVMAttacher_Init(JVMAttacher *self,MCJavaVMHost019 *host){self->host=host;self->env=NULL;self->attached=FALSE;if(host->getEnv(host->vm,&self->env,65540)){host->attach(host->vm,&self->env);self->attached=self->env!=NULL;}}
U0 JVMAttacher_forceDetach(JVMAttacher *self){if(self->attached){self->host->detach(self->host->vm);self->attached=FALSE;}}
U0 JVMAttacher_Destroy(JVMAttacher *self){JVMAttacher_forceDetach(self);}

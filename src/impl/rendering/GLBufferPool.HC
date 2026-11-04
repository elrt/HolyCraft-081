// Batch 003. Source: minecraftpe/impl/rendering/GLBufferPool.cpp
GLBufferPool glBufferPool;
U0 GLBufferPool_Init(GLBufferPool *self,U32 reserveCnt) { MCVector_Init(&self->usedBuffers,sizeof(U32));MCVector_Init(&self->unusedBuffers,sizeof(U32));self->reserveCnt=reserveCnt; }
U32 GLBufferPool_get(GLBufferPool *self) { while(self->unusedBuffers.size<self->reserveCnt) { U32 id=0;glGenBuffers(1,&id);if(glGetError()) break;MCVector_Push(&self->unusedBuffers,&id); } if(!self->unusedBuffers.size) return 0;U32 *p=MCVector_At(&self->unusedBuffers,0);U32 id=*p;MCVector_Erase(&self->unusedBuffers,0);MCVector_Push(&self->usedBuffers,&id);return id; }
U0 GLBufferPool_release(GLBufferPool *self,U32 id) { MCVector_Push(&self->unusedBuffers,&id);I64 i; for(i=0;i<self->usedBuffers.size;i++) { U32 *p=MCVector_At(&self->usedBuffers,i);if(*p==id){ MCVector_Erase(&self->usedBuffers,i);break;} } }
Bool GLBufferPool_trim(GLBufferPool *self) { if(!self->unusedBuffers.size)return FALSE;while(self->unusedBuffers.size){glDeleteBuffers(1,MCVector_At(&self->unusedBuffers,0));MCVector_Erase(&self->unusedBuffers,0);}return TRUE; }
U0 GLBufferPool_Destroy(GLBufferPool *self) { GLBufferPool_trim(self);MCVector_Destroy(&self->usedBuffers);MCVector_Destroy(&self->unusedBuffers); }


// Batch 003. Source: minecraftpe/headers/rendering/GLBufferPool.hpp
#ifndef MCPE_HEADERS_RENDERING_GLBUFFERPOOL_HPP
#define MCPE_HEADERS_RENDERING_GLBUFFERPOOL_HPP
class GLBufferPool { MCVector usedBuffers,unusedBuffers;I32 reserveCnt; };
extern GLBufferPool glBufferPool;
U0 GLBufferPool_Init(GLBufferPool *self,U32 reserveCnt);
U32 GLBufferPool_get(GLBufferPool *self);
U0 GLBufferPool_release(GLBufferPool *self,U32 id);
Bool GLBufferPool_trim(GLBufferPool *self);
U0 GLBufferPool_Destroy(GLBufferPool *self);

#endif


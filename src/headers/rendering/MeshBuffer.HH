// Batch 003. Source: minecraftpe/headers/rendering/MeshBuffer.hpp
#ifndef MCPE_HEADERS_RENDERING_MESHBUFFER_HPP
#define MCPE_HEADERS_RENDERING_MESHBUFFER_HPP
class MeshBufferVertexFormat { U8 offsets[4],stride; };
U0 MeshBufferVertexFormat_Init(MeshBufferVertexFormat *self) { memset(self->offsets,255,4);self->stride=0; }
U0 MeshBufferVertexFormat_enableField(MeshBufferVertexFormat *self,I32 field) { U8 sizes[4]={12,8,4,4};if(field<0 || field>=4)exit(85);if(self->offsets[field]==255){self->offsets[field]=self->stride;self->stride+=sizes[field];} }
U0 MeshBufferVertexFormat_bindArrays(MeshBufferVertexFormat *self);
class MeshBuffer { U32 arrayBuffer,arrayElementsBuffer;I32 arraysCount,elementsCount;F32 transformX,transformY,transformZ;I32 drawMode,drawType;MeshBufferVertexFormat *vertexFormat; };
U0 MeshBuffer_Init(MeshBuffer *self) { memset(self,0,sizeof(MeshBuffer)); }
Bool MeshBuffer_isValid(MeshBuffer *self) { return self->arrayBuffer && self->arraysCount>3 && self->drawMode!=0 && self->vertexFormat!=NULL; }
U0 MeshBuffer_reset(MeshBuffer *self); U0 MeshBuffer_render(MeshBuffer *self); U0 MeshBuffer_Destroy(MeshBuffer *self) { MeshBuffer_reset(self); }
U0 MeshBuffer_MoveInit(MeshBuffer *self,MeshBuffer *other);MeshBuffer *MeshBuffer_Move(MeshBuffer *self,MeshBuffer *other);
Bool MeshBuffer_load(MeshBuffer *self,MeshBufferVertexFormat *format,U0 *vertices,I32 count,U0 *indices,U32 elementCount,I32 elementSize,U32 mode);
Bool MeshBuffer_LoadInit(MeshBuffer *self,MeshBufferVertexFormat *format,U0 *vertices,I32 count,U0 *indices,U32 elementCount,I32 elementSize,U32 mode) { MeshBuffer_Init(self);return MeshBuffer_load(self,format,vertices,count,indices,elementCount,elementSize,mode); }

#endif


// Batch 003. Source: minecraftpe/headers/rendering/RenderCall.hpp
#ifndef MCPE_HEADERS_RENDERING_RENDERCALL_HPP
#define MCPE_HEADERS_RENDERING_RENDERCALL_HPP
class RenderCall { I32 field_0;MeshBuffer field_4;MCString field_2C;Bool field_30,field_31,field_32;I8 field_33; };
U0 RenderCall_Init(RenderCall *self) { self->field_0=0;MeshBuffer_Init(&self->field_4);MCString_Init(&self->field_2C);self->field_30=FALSE;self->field_31=FALSE;self->field_32=FALSE;self->field_33=0; }
U0 RenderCall_Destroy(RenderCall *self) { MeshBuffer_Destroy(&self->field_4);MCString_Destroy(&self->field_2C); }

#endif


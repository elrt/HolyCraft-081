// Batch 005. Source: minecraftpe/headers/rendering/model/Cube.hpp
#ifndef MCPE_HEADERS_RENDERING_MODEL_CUBE_HPP
#define MCPE_HEADERS_RENDERING_MODEL_CUBE_HPP
class Cube { VertexPT field_0[8];PolygonQuad quads[6];MCString id;F32 field_29C,field_2A0,field_2A4,field_2A8,field_2AC,field_2B0; };
U0 Cube_Init(Cube *self,ModelPart *a2,I32 a3,I32 a4,F32 a5,F32 a6,F32 a7,I32 a8,I32 a9,I32 a10,F32 a11);
U0 Cube_compile(Cube *self,MCVertexSink *sink,F32 scale);
Cube *Cube_setId(Cube *self,MCString *id);
U0 Cube_CopyInit(Cube *self,Cube *other);U0 Cube_Destroy(Cube *self);

#endif


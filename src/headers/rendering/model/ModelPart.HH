// Batch 005. Source: minecraftpe/headers/rendering/model/ModelPart.hpp
#ifndef MCPE_HEADERS_RENDERING_MODEL_MODELPART_HPP
#define MCPE_HEADERS_RENDERING_MODEL_MODELPART_HPP
class Cube;
class ModelPart { Bool noFaceCull;F32 xOffset,yOffset,zOffset,xRotAngle,yRotAngle,zRotAngle;Bool mirror,field_1D;MCPtrVector cubes,children;MCString field_38;F32 texWidth,texHeight;I32 texOffsetX,texOffsetY;Bool field_4C;I32 field_50;MeshBuffer meshBuffer;Model *parent; };
U0 ModelPart_Init(ModelPart *self,I32 x=0,I32 y=0,I32 width=64,I32 height=32);
U0 ModelPart_InitModel(ModelPart *self,Model *model,I32 x,I32 y,I32 width,I32 height);
U0 ModelPart_InitName(ModelPart *self,MCString *name);
U0 ModelPart__init(ModelPart *self,I32 width,I32 height);
ModelPart *ModelPart_addBox(ModelPart *self,F32 x,F32 y,F32 z,I32 width,I32 height,I32 depth,F32 inflate=0);
ModelPart *ModelPart_addBoxName(ModelPart *self,MCString *name,F32 x,F32 y,F32 z,I32 width,I32 height,I32 depth);
U0 ModelPart_addChild(ModelPart *self,ModelPart *child);
U0 ModelPart_compile(ModelPart *self,F32 scale);
U0 ModelPart_draw(ModelPart *self,F32 scale);
U0 ModelPart_drawSlow(ModelPart *self,F32 scale);
U0 ModelPart_mimic(ModelPart *self,ModelPart *other);
ModelPart *ModelPart_Assign(ModelPart *self,ModelPart *other);
U0 ModelPart_render(ModelPart *self,F32 scale);
U0 ModelPart_renderHorrible(ModelPart *self,F32 scale);
U0 ModelPart_reset(ModelPart *self);
U0 ModelPart_setModel(ModelPart *self,Model *model);
U0 ModelPart_setPos(ModelPart *self,F32 x,F32 y,F32 z);
ModelPart *ModelPart_setTexSize(ModelPart *self,I32 width,I32 height);
ModelPart *ModelPart_texOffs(ModelPart *self,I32 x,I32 y);
U0 ModelPart_translateTo(ModelPart *self,F32 scale);
U0 ModelPart_Destroy(ModelPart *self);

#endif


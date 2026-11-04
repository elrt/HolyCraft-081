// Batch 005. Source: minecraftpe/headers/rendering/model/QuadrupedModel.hpp
#ifndef MCPE_HEADERS_RENDERING_MODEL_QUADRUPEDMODEL_HPP
#define MCPE_HEADERS_RENDERING_MODEL_QUADRUPEDMODEL_HPP
class QuadrupedModel: Model { ModelPart field_18 , field_98 , field_118 ;
 ModelPart field_198 , field_218 , field_298 , field_318 ;
 F32 field_398 , field_39C ;
 };
U0 QuadrupedModel_Init(QuadrupedModel *self,I32 a2 , F32 a3 , I32 a4 , I32 a5);
U0 QuadrupedModel_Destroy(QuadrupedModel *self);
U0 QuadrupedModel_render(QuadrupedModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7 , F32 a8);
U0 QuadrupedModel_setupAnim(QuadrupedModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7);
U0 QuadrupedModel__renderFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8);
U0 QuadrupedModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7);

#endif


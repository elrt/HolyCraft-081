// Batch 005. Source: minecraftpe/headers/rendering/model/HumanoidModel.hpp
#ifndef MCPE_HEADERS_RENDERING_MODEL_HUMANOIDMODEL_HPP
#define MCPE_HEADERS_RENDERING_MODEL_HUMANOIDMODEL_HPP
class HumanoidModel: Model { ModelPart headModel , bodyModel ;
 ModelPart rightArmModel , leftArmModel ;
 ModelPart rightLegModel , leftLegModel ;
 I8 field_318 , field_319 , field_31A ;
 Bool isUsingBow ;
 I32 field_31C ;
 };
U0 HumanoidModel_Init(HumanoidModel *self,F32 a2 , F32 a3);
U0 HumanoidModel_Destroy(HumanoidModel *self);
U0 HumanoidModel_render(HumanoidModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7 , F32 a8);
U0 HumanoidModel_renderHorrible(HumanoidModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7);
U0 HumanoidModel_setupAnim(HumanoidModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7);
U0 HumanoidModel__renderFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8);
U0 HumanoidModel__horribleFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7);
U0 HumanoidModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7);

#endif


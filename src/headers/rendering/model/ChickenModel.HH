// Batch 005. Source: minecraftpe/headers/rendering/model/ChickenModel.hpp
#ifndef MCPE_HEADERS_RENDERING_MODEL_CHICKENMODEL_HPP
#define MCPE_HEADERS_RENDERING_MODEL_CHICKENMODEL_HPP
class ChickenModel: Model { ModelPart headModel , field_98 , bodyModel , leg1Model ;
 ModelPart leg2Model , wing1Model , wing2Model , beakModel , redThingModel ;
 };
U0 ChickenModel_Init(ChickenModel *self);
U0 ChickenModel_Destroy(ChickenModel *self);
U0 ChickenModel_render(ChickenModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7 , F32 a8);
U0 ChickenModel_setupAnim(ChickenModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7);
U0 ChickenModel__renderFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8);
U0 ChickenModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7);

#endif


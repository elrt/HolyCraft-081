// Batch 005. Source: minecraftpe/headers/rendering/model/MinecartModel.hpp
#ifndef MCPE_HEADERS_RENDERING_MODEL_MINECARTMODEL_HPP
#define MCPE_HEADERS_RENDERING_MODEL_MINECARTMODEL_HPP
class MinecartModel: Model { ModelPart field_18 [ 7 ] ;
 };
U0 MinecartModel_Init(MinecartModel *self);
U0 MinecartModel_Destroy(MinecartModel *self);
U0 MinecartModel_render(MinecartModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7 , F32 a8);
U0 MinecartModel__renderFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8);

#endif


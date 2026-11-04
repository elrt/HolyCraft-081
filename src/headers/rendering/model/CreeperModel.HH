// Batch 005. Source: minecraftpe/headers/rendering/model/CreeperModel.hpp
#ifndef MCPE_HEADERS_RENDERING_MODEL_CREEPERMODEL_HPP
#define MCPE_HEADERS_RENDERING_MODEL_CREEPERMODEL_HPP
class CreeperModel: Model { ModelPart field_1C , field_9C , field_11C , field_19C , field_21C , field_29C ;
 };
U0 CreeperModel_Init(CreeperModel *self,F32 a2);
U0 CreeperModel_Destroy(CreeperModel *self);
U0 CreeperModel_render(CreeperModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7 , F32 a8);
U0 CreeperModel_setupAnim(CreeperModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7);
U0 CreeperModel__renderFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8);
U0 CreeperModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7);

#endif


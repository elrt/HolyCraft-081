// Batch 005. Source: minecraftpe/headers/rendering/model/SpiderModel.hpp
#ifndef MCPE_HEADERS_RENDERING_MODEL_SPIDERMODEL_HPP
#define MCPE_HEADERS_RENDERING_MODEL_SPIDERMODEL_HPP
class SpiderEyesModel: Model { ModelPart field_1C ;
 };
U0 SpiderEyesModel_Init(SpiderEyesModel *self);
U0 SpiderEyesModel_Destroy(SpiderEyesModel *self);
U0 SpiderEyesModel_render(SpiderEyesModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7 , F32 a8);
U0 SpiderEyesModel_setupAnim(SpiderEyesModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7);
U0 SpiderEyesModel__renderFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8);
U0 SpiderEyesModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7);
class SpiderModel: Model { ModelPart field_1C , field_9C , field_11C , field_19C ;
 ModelPart field_21C , field_29C , field_31C , field_39C ;
 ModelPart field_41C , field_49C , field_51C ;
 };
U0 SpiderModel_Init(SpiderModel *self);
U0 SpiderModel_Destroy(SpiderModel *self);
U0 SpiderModel_render(SpiderModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7 , F32 a8);
U0 SpiderModel_setupAnim(SpiderModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7);
U0 SpiderModel__renderFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8);
U0 SpiderModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7);

#endif


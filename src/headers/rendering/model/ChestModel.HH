// Batch 005. Source: minecraftpe/headers/rendering/model/ChestModel.hpp
#ifndef MCPE_HEADERS_RENDERING_MODEL_CHESTMODEL_HPP
#define MCPE_HEADERS_RENDERING_MODEL_CHESTMODEL_HPP
class ChestModel: Model { ModelPart field_18 , field_98 , field_118 ;
 Bool field_198 ;
 I8 field_199 , field_19A , field_19B ;
 };
U0 ChestModel_Init(ChestModel *self,Bool a2);
U0 ChestModel_Destroy(ChestModel *self);
U0 ChestModel_renderSimple(ChestModel *self);
U0 ChestModel__simpleFn(Model *base);

#endif


// Batch 005. Source: minecraftpe/headers/rendering/model/SignModel.hpp
#ifndef MCPE_HEADERS_RENDERING_MODEL_SIGNMODEL_HPP
#define MCPE_HEADERS_RENDERING_MODEL_SIGNMODEL_HPP
class SignModel: Model { ModelPart field_1C , field_9C ;
 };
U0 SignModel_Init(SignModel *self);
U0 SignModel_Destroy(SignModel *self);
U0 SignModel_renderSimple(SignModel *self);
U0 SignModel__simpleFn(Model *base);

#endif


// Batch 005. Source: minecraftpe/headers/rendering/model/SheepModel.hpp
#ifndef MCPE_HEADERS_RENDERING_MODEL_SHEEPMODEL_HPP
#define MCPE_HEADERS_RENDERING_MODEL_SHEEPMODEL_HPP
class SheepModel: QuadrupedModel { F32 headEatAngleScale ;
 };
U0 SheepModel_Init(SheepModel *self,Bool a2);
U0 SheepModel_Destroy(SheepModel *self);
U0 SheepModel_setupAnim(SheepModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7);
U0 SheepModel_prepareMobModel(SheepModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5);
U0 SheepModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7);
U0 SheepModel__prepareFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5);

#endif


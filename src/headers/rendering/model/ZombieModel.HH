// Batch 005. Source: minecraftpe/headers/rendering/model/ZombieModel.hpp
#ifndef MCPE_HEADERS_RENDERING_MODEL_ZOMBIEMODEL_HPP
#define MCPE_HEADERS_RENDERING_MODEL_ZOMBIEMODEL_HPP
class ZombieModel: HumanoidModel {  };
U0 ZombieModel_Init(ZombieModel *self);
U0 ZombieModel_Destroy(ZombieModel *self);
U0 ZombieModel_setupAnim(ZombieModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7);
U0 ZombieModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7);

#endif


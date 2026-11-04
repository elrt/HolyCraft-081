// Batch 005. Source: minecraftpe/headers/rendering/model/SkeletonModel.hpp
#ifndef MCPE_HEADERS_RENDERING_MODEL_SKELETONMODEL_HPP
#define MCPE_HEADERS_RENDERING_MODEL_SKELETONMODEL_HPP
class SkeletonModel: ZombieModel {  };
U0 SkeletonModel_Init(SkeletonModel *self);
U0 SkeletonModel_Destroy(SkeletonModel *self);
U0 SkeletonModel_render(SkeletonModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7 , F32 a8);
U0 SkeletonModel_setupAnim(SkeletonModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7);
U0 SkeletonModel__renderFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8);
U0 SkeletonModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7);

#endif


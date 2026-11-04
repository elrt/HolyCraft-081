// Batch 004. Source: minecraftpe/headers/level/gen/feature/Feature.hpp
#ifndef MCPE_HEADERS_LEVEL_GEN_FEATURE_FEATURE_HPP
#define MCPE_HEADERS_LEVEL_GEN_FEATURE_FEATURE_HPP
class Feature { Bool update; U0 *context; Bool (*place)(U0 *self,MCFeatureWorld *world,Random *random,I32 x,I32 y,I32 z); U0 (*init)(U0 *self,F32 x,F32 y,F32 z); U0 (*destroy)(U0 *self); };
U0 Feature_Init(Feature *self,Bool update);
U0 Feature_placeBlock(Feature *self,MCFeatureWorld *world,I32 x,I32 y,I32 z,I32 id,I32 data=0);
U0 Feature_init(Feature *self,F32 x,F32 y,F32 z);
U0 Feature_Destroy(Feature *self);

#endif


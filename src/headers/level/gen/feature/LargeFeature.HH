// Batch 004. Source: minecraftpe/headers/level/gen/feature/LargeFeature.hpp
#ifndef MCPE_HEADERS_LEVEL_GEN_FEATURE_LARGEFEATURE_HPP
#define MCPE_HEADERS_LEVEL_GEN_FEATURE_LARGEFEATURE_HPP
class LargeFeature { I32 range; Random random; U0 *context; U0 (*addFeature)(U0 *self,MCFeatureWorld *level,I32 x,I32 z,I32 cx,I32 cz,U8 *blocks,I32 stride); };
U0 LargeFeature_Init(LargeFeature *self,U0 *context,U0 (*addFeature)(U0 *self,MCFeatureWorld *level,I32 x,I32 z,I32 cx,I32 cz,U8 *blocks,I32 stride));
U0 LargeFeature_apply(LargeFeature *self,MCFeatureWorld *level,I32 cx,I32 cz,U8 *blocks,I32 stride);
U0 LargeFeature_Destroy(LargeFeature *self);

#endif


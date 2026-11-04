// Batch 003. Source: minecraftpe/headers/rendering/frustum/Frustum.hpp
#ifndef MCPE_HEADERS_RENDERING_FRUSTUM_FRUSTUM_HPP
#define MCPE_HEADERS_RENDERING_FRUSTUM_FRUSTUM_HPP
class Frustum : FrustumData {};
extern Frustum Frustum_frustum;
U0 Frustum_normalizePlane(F32 *planes,I32 index);
U0 Frustum_calculateFrustum(Frustum *self);

#endif


// Batch 003. Source: minecraftpe/headers/rendering/frustum/FrustumCuller.hpp
#ifndef MCPE_HEADERS_RENDERING_FRUSTUM_FRUSTUMCULLER_HPP
#define MCPE_HEADERS_RENDERING_FRUSTUM_FRUSTUMCULLER_HPP
class FrustumCuller { FrustumData data; F32 xOff,yOff,zOff; };
Bool FrustumCuller_isVisible(FrustumCuller *self,AABB *bb) { return FrustumData_cubeInFrustum(&self->data,bb->minX-self->xOff,bb->minY-self->yOff,bb->minZ-self->zOff,bb->maxX-self->xOff,bb->maxY-self->yOff,bb->maxZ-self->zOff); }

#endif


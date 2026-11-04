// Port batch 001. Upstream: minecraftpe/headers/math/HitResult.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_MATH_HITRESULT_HPP
#define MCPE_HEADERS_MATH_HITRESULT_HPP
class HitResult {
 I32 hitType,x,y,z,field_10; Vec3 hitVec; U0 *entity; I8 field_24,field_25,field_26,field_27;
};
U0 HitResult_Init(HitResult *self);
U0 HitResult_InitBlock(HitResult *self,I32 x,I32 y,I32 z,I32 side,Vec3 *pos);
U0 HitResult_InitEntity(HitResult *self,U0 *entity,Vec3 *entityPosition);
U0 HitResult_CopyInit(HitResult *self,HitResult *other);
F32 HitResult_distanceTo(HitResult *self,Vec3 *entityPosition);
#endif


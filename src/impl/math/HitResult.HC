// Port batch 001. Upstream: minecraftpe/impl/math/HitResult.cpp
// API: explicit self pointers; see docs/PORTING.md.
U0 HitResult_Init(HitResult *self) {
 self->hitType=2; self->entity=NULL; self->field_24=0; Vec3_Init(&self->hitVec);
}
U0 HitResult_InitBlock(HitResult *self,I32 x,I32 y,I32 z,I32 side,Vec3 *pos) {
 Vec3_Init(&self->hitVec,pos->x,pos->y,pos->z); self->z=z; self->hitType=0; self->field_10=side;
 self->x=x; self->y=y; self->entity=NULL; self->field_24=0;
}
U0 HitResult_InitEntity(HitResult *self,U0 *entity,Vec3 *entityPosition) {
 self->hitType=1; self->entity=entity; self->field_24=0;
 Vec3_Init(&self->hitVec,entityPosition->x,entityPosition->y,entityPosition->z);
}
U0 HitResult_CopyInit(HitResult *self,HitResult *other) {
 Vec3_Copy(&self->hitVec,&other->hitVec); self->hitType=other->hitType;
 self->x=other->x; self->y=other->y; self->z=other->z; self->field_10=other->field_10;
 self->entity=other->entity; self->field_24=other->field_24;
}
F32 HitResult_distanceTo(HitResult *self,Vec3 *entityPosition) {
 return Vec3_distanceToSqr(&self->hitVec,entityPosition);
}

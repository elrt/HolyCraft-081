// Port batch 001. Upstream: minecraftpe/headers/math/SmoothFloat.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_MATH_SMOOTHFLOAT_HPP
#define MCPE_HEADERS_MATH_SMOOTHFLOAT_HPP
class SmoothFloat { F32 field_0,field_4,field_8; };
U0 SmoothFloat_Init(SmoothFloat *self) { self->field_0=0; self->field_4=0; self->field_8=0; }
F32 SmoothFloat_getNewDeltaValue(SmoothFloat *self,F32 a,F32 b) {
 F32 v3=self->field_4, v4=a+self->field_0, v5, v6;
 self->field_0=v4; v5=(v4-v3)*b;
 v6=self->field_8+(v5-self->field_8)*0.5; self->field_8=v6;
 if(v5<=0.0 || v5<=v6) { if(v5>=0.0) v6=v5; else if(v5>=v6) v6=v5; }
 self->field_4=v3+v6; return v6;
}
#endif


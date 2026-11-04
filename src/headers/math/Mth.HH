// Port batch 001. Upstream: minecraftpe/headers/math/Mth.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_MATH_MTH_HPP
#define MCPE_HEADERS_MATH_MTH_HPP
F32 Mth_cos(F32 x);
F32 Mth_sin(F32 x);
I32 Mth_floor(F32 x) { I32 i=x; if(x<i) return i-1; return i; }
I32 Mth_intFloorDiv(I32 x,I32 y) { if(x>=0) return x/y; return ~(~x/y); }
F32 Mth_wrapDegrees(F32 f) {
 F32 v=fmodf(f,360.0),out=v; if(v>=180.0) out=v-360; if(v< -180.0) return out+360; return out;
}
U32 Mth_fastRandom();
F32 Mth_random();
U32 Mth_randomBound(I32 bound);
F32 Mth_clampRotate(F32 f,F32 target,F32 limit) {
 F32 d=fmodf(target-f,360.0),v=d,lo;
 if(d>=180.0) v=d-360; if(v< -180.0) v+=360;
 lo=-limit; if(v>limit) v=limit; if(v>=lo) lo=v; return f+lo;
}
F32 Mth_sqrt(F32 f) { return sqrt(f); }
F32 Mth_atan2(F32 x,F32 y) { return atan2(x,y); }
F32 Mth_rsqrt(F32 number) {
 I32 bits; F32 x2=number*0.5,y=number;
 memcpy(&bits,&y,4); bits=0x5f3759df-(bits>>1); memcpy(&y,&bits,4);
 return y*(1.5-(x2*y*y));
}
F32 Mth_rad2deg(F32 r) { return r*57.296; }
F32 Mth_deg2rad(F32 r) { return r*0.017453; }

#endif


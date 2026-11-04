// Port batch 001. Upstream: minecraftpe/impl/math/Mth.cpp
// API: explicit self pointers; see docs/PORTING.md.
F32 Mth_PI=3.1416, Mth_TAU=6.2832, Mth_DEGRAD=0.017453, Mth_RADDEG=57.296, Mth__sinScale=10430.0;
F32 Mth__sin[65536];
Random Mth__random;
I32 Mth_fast_x=123456789,Mth_fast_y=362436069,Mth_fast_z=521288629,Mth_fast_w=88675123;
F32 Mth_cos(F32 x) { I32 i=x*Mth__sinScale+16384.0; return Mth__sin[i&0xffff]; }
F32 Mth_sin(F32 x) { I32 i=x*Mth__sinScale; return Mth__sin[i&0xffff]; }
U32 Mth_fastRandom() {
 U32 v=Mth_fast_x^(Mth_fast_x<<11),r;
 Mth_fast_x=Mth_fast_y; Mth_fast_y=Mth_fast_z; Mth_fast_z=Mth_fast_w;
 r=Mth_fast_w^(Mth_fast_w>>19)^v^(v>>8); Mth_fast_w=r; return r;
}
F32 Mth_random() { return Random_genrand_int32(&Mth__random)*0.000000000232830644; }
U32 Mth_randomBound(I32 bound) { return Random_genrand_int32(&Mth__random)%bound(U32); }
U0 Mth_RuntimeInit() { Random_Init(&Mth__random); }
// Sine table is NOT silently populated here. Upstream fills it in NinecraftApp::init.


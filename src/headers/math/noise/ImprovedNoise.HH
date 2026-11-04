// Batch 002. Source: minecraftpe/headers/math/noise/ImprovedNoise.hpp
#ifndef MCPE_HEADERS_MATH_NOISE_IMPROVEDNOISE_HPP
#define MCPE_HEADERS_MATH_NOISE_IMPROVEDNOISE_HPP
F32 FADE(F32 x) { return x*x*x*(x*(x*6-15)+10); }
class ImprovedNoise : Synth { I8 field_4,field_5,field_6,field_7; F32 xCoord,yCoord,zCoord; I32 permutations[512]; };
U0 ImprovedNoise_init(ImprovedNoise *self,Random* a2);
F32 ImprovedNoise_lerp(ImprovedNoise *self,F32 a2, F32 a3, F32 a4);
F32 ImprovedNoise_grad2(ImprovedNoise *self,I32 a2, F32 a3, F32 a4);
F32 ImprovedNoise_grad(ImprovedNoise *self,I32 a2, F32 a3, F32 a4, F32 a5);
F32 ImprovedNoise_noise(ImprovedNoise *self,F32 x, F32 y, F32 z);
F32 ImprovedNoise_getValue2(ImprovedNoise *self,F32 x, F32 y);
F32 ImprovedNoise_getValue3(ImprovedNoise *self,F32 x, F32 y, F32 z);
U0 ImprovedNoise_add(ImprovedNoise *self,F32* noises, F32 x, F32 y, F32 z, I32 width, I32 height, I32 depth, F32 scaleX, F32 scaleY, F32 scaleZ, F32 scale);
I32 ImprovedNoise_hashCode(ImprovedNoise *self);
F32 ImprovedNoise_GetValueDispatch(Synth *base,F32 x,F32 y) { ImprovedNoise *self=base; return ImprovedNoise_getValue2(self,x,y); }
U0 ImprovedNoise_DestroyDispatch(Synth *base) {} // Source destructor is empty.
U0 ImprovedNoise_InitRandom(ImprovedNoise *self,Random *random) {
 Synth_Init(self,&ImprovedNoise_GetValueDispatch,&ImprovedNoise_DestroyDispatch); ImprovedNoise_init(self,random);
}
U0 ImprovedNoise_Init(ImprovedNoise *self) { Random random; Random_InitSeed(&random,1); ImprovedNoise_InitRandom(self,&random); }
ImprovedNoise *ImprovedNoise_New(Random *random) { ImprovedNoise *self=MC_Alloc(sizeof(ImprovedNoise)); ImprovedNoise_InitRandom(self,random); return self; }

#endif


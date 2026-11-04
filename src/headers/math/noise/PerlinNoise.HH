// Batch 002. Source: minecraftpe/headers/math/noise/PerlinNoise.hpp
#ifndef MCPE_HEADERS_MATH_NOISE_PERLINNOISE_HPP
#define MCPE_HEADERS_MATH_NOISE_PERLINNOISE_HPP
class PerlinNoise : Synth { ImprovedNoise **octaves; I32 octavesAmount; Random randomSelf; Random *randomPtr; };
F32 PerlinNoise_getValue2(PerlinNoise *self,F32 x, F32 y);
U0 PerlinNoise_init(PerlinNoise *self,I32 count);
F32 PerlinNoise_getValue3(PerlinNoise *self,F32 x, F32 y, F32 z);
F32* PerlinNoise_getRegion3(PerlinNoise *self,F32* array, F32 a3, F32 a4, F32 a5, I32 a6, I32 a7, I32 a8, F32 a9, F32 a10, F32 a11);
F32* PerlinNoise_getRegion2(PerlinNoise *self,F32* a2, I32 a3, I32 a4, I32 a5, I32 a6, F32 a7, F32 a8, F32 a9);
I32 PerlinNoise_hashCode(PerlinNoise *self);
F32 PerlinNoise_GetValueDispatch(Synth *base,F32 x,F32 y) { PerlinNoise *self=base; return PerlinNoise_getValue2(self,x,y); }
U0 PerlinNoise_Destroy(PerlinNoise *self) { I32 i; for(i=0;i<self->octavesAmount;i++) free(self->octaves[i]); free(self->octaves); self->octaves=NULL; self->octavesAmount=0; }
U0 PerlinNoise_DestroyDispatch(Synth *base) { PerlinNoise_Destroy(base); }
U0 PerlinNoise_InitRandom(PerlinNoise *self,Random *random,I32 count) {
 Synth_Init(self,&PerlinNoise_GetValueDispatch,&PerlinNoise_DestroyDispatch); Random_Init(&self->randomSelf); self->randomPtr=random; PerlinNoise_init(self,count);
}
U0 PerlinNoise_Init(PerlinNoise *self,I32 count) {
 Synth_Init(self,&PerlinNoise_GetValueDispatch,&PerlinNoise_DestroyDispatch); Random_Init(&self->randomSelf); self->randomPtr=&self->randomSelf; PerlinNoise_init(self,count);
}

#endif


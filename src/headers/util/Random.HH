// Port batch 001. Upstream: minecraftpe/headers/util/Random.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_UTIL_RANDOM_HPP
#define MCPE_HEADERS_UTIL_RANDOM_HPP
class Random {
 I32 seed; U32 permutations[624]; I32 index; Bool haveNextNextGaussian; F32 nextNextGaussian;
};
U0 Random_init_genrand(Random *self,U32 seed) {
 self->permutations[0]=seed;
 for(self->index=1;self->index<624;self->index++)
  self->permutations[self->index]=0x6c078965*(self->permutations[self->index-1]>>30 ^ self->permutations[self->index-1])+self->index;
}
U0 Random_setSeed(Random *self,I64 seed) {
 self->seed=seed; self->index=625; self->haveNextNextGaussian=FALSE; self->nextNextGaussian=0;
 Random_init_genrand(self,seed);
}
U0 Random_InitSeed(Random *self,I64 seed) { Random_setSeed(self,seed); }
U0 Random_Init(Random *self) { Random_setSeed(self,MC_GetTimeMs()); }
U32 Random_genrand_int32(Random *self) {
 U32 mag01[2]={0,0x9908B0DF},kk,y;
 if(self->index>623) {
  if(self->index==625) Random_init_genrand(self,5489);
  for(kk=0;kk<227;kk++) {
   y=(self->permutations[kk]&0x80000000)|(self->permutations[kk+1]&0x7fffffff);
   self->permutations[kk]=self->permutations[kk+397]^(y>>1)^mag01[y&1];
  }
  for(;kk<623;kk++) {
   y=(self->permutations[kk]&0x80000000)|(self->permutations[kk+1]&0x7fffffff);
   self->permutations[kk]=self->permutations[kk-227]^(y>>1)^mag01[y&1];
  }
  y=(self->permutations[623]&0x80000000)|(self->permutations[0]&0x7fffffff);
  self->permutations[623]=self->permutations[396]^(y>>1)^mag01[y&1]; self->index=0;
 }
 y=self->permutations[self->index++]; y^=y>>11; y^=(y<<7)&0x9d2c5680; y^=(y<<15)&0xefc60000; y^=y>>18;
 return y;
}
F32 Random_nextFloat(Random *self) { return Random_genrand_int32(self)*0.000000000232830644; }
I32 Random_nextInt(Random *self,I32 limit) { return Random_genrand_int32(self)%limit(U32); }
F32 Random_nextGaussian(Random *self) {
 F32 x,y,s,k;
 if(self->haveNextNextGaussian) { self->haveNextNextGaussian=FALSE; return self->nextNextGaussian; }
 do { x=Random_nextFloat(self)*2-1; y=Random_nextFloat(self)*2-1; s=y*y+x*x; } while(s>=1 || s==0);
 k=sqrtf((logf(s)*-2)/s); self->nextNextGaussian=y*k; self->haveNextNextGaussian=TRUE; return x*k;
}

#endif


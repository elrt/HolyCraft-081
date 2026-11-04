// Batch 004. Source: minecraftpe/impl/level/gen/feature/LargeFeature.cpp
U0 LargeFeature_Init(LargeFeature *self,U0 *context,U0 (*addFeature)(U0 *self,MCFeatureWorld *level,I32 x,I32 z,I32 cx,I32 cz,U8 *blocks,I32 stride)) { self->range=8; Random_InitSeed(&self->random,0); self->context=context; self->addFeature=addFeature; }
U0 LargeFeature_Destroy(LargeFeature *self) {}
U0 LargeFeature_apply(LargeFeature *self,MCFeatureWorld *level,I32 cx,I32 cz,U8 *blocks,I32 stride) { I32 range=self->range,x,z,a,b,base,s; if(!self->addFeature) { printf("Missing LargeFeature.addFeature\n"); exit(84); } Random_setSeed(&self->random,level->seed); a=2*(Random_genrand_int32(&self->random)>>2)+1; b=2*(Random_genrand_int32(&self->random)>>2)+1; base=b*(cz-range)+a*(cx-range); for(x=cx-range;x<=cx+range;x++) { s=base; for(z=cz-range;z<=cz+range;z++) { Random_setSeed(&self->random,level->seed^s); self->addFeature(self->context,level,x,z,cx,cz,blocks,stride); s+=b; } base+=a; } }


// Port batch 001. Upstream: minecraftpe/impl/math/noise/Synth.cpp
// API: explicit self pointers; see docs/PORTING.md.
U0 Synth_Init(Synth *self,F32 (*getValue)(Synth *self,F32 x,F32 y),U0 (*destroy)(Synth *self)) {
 self->getValueFn=getValue; self->destroyFn=destroy;
}
U0 Synth_Destroy(Synth *self) { if(self->destroyFn) self->destroyFn(self); }
I32 Synth_getDataSize(Synth *self,I32 x,I32 y) { return x*y*4; }
U0 Synth_create(Synth *self,I32 x,I32 y,F32 *arr) {
 I32 i,j; F32 fx,fy; for(i=0;i<y;i++) for(j=0;j<x;j++) { fx=j; fy=i; arr[i*x+j]=self->getValueFn(self,fx,fy); }
}

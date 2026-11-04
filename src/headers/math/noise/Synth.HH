// Port batch 001. Upstream: minecraftpe/headers/math/noise/Synth.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_MATH_NOISE_SYNTH_HPP
#define MCPE_HEADERS_MATH_NOISE_SYNTH_HPP
class Synth {
 F32 (*getValueFn)(Synth *self,F32 x,F32 y);
 U0 (*destroyFn)(Synth *self);
};
U0 Synth_Init(Synth *self,F32 (*getValue)(Synth *self,F32 x,F32 y),U0 (*destroy)(Synth *self));
U0 Synth_Destroy(Synth *self);
I32 Synth_getDataSize(Synth *self,I32 x,I32 y);
U0 Synth_create(Synth *self,I32 x,I32 y,F32 *arr);
#endif


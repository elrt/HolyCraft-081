// Batch 002. Source: minecraftpe/headers/input/ITurnInput.hpp
#ifndef MCPE_HEADERS_INPUT_ITURNINPUT_HPP
#define MCPE_HEADERS_INPUT_ITURNINPUT_HPP
class ITurnInput : IConfigListener { I32 field_4; F64 curTime; U0 (*turnFn)(ITurnInput *self,Vec3 *out); };
F32 ITurnInput_getDeltaTime(ITurnInput *self) {
 if(self->curTime== -1.0) self->curTime=MC_GetTimeS(); F64 time=MC_GetTimeS(),previous=self->curTime; self->curTime=time; return time-previous;
}
F32 ITurnInput_linearTransform(F32 value,F32 deadzone,F32 scale,Bool clamp) {
 if(value<0) deadzone=-deadzone; if(fabsf(deadzone)>=fabsf(value)) return 0;
 F32 out=(value-deadzone)*scale; if(clamp && fabsf(out)>1) return out/fabsf(out); return out;
}
U0 ITurnInput_getTurnDelta(ITurnInput *self,Vec3 *out) { self->turnFn(self,out); }

#endif


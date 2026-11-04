// Batch 002. Source: minecraftpe/headers/util/OffsetPosTranslator.hpp
#ifndef MCPE_HEADERS_UTIL_OFFSETPOSTRANSLATOR_HPP
#define MCPE_HEADERS_UTIL_OFFSETPOSTRANSLATOR_HPP
class OffsetPosTranslator : IPosTranslator { F32 x,y,z; };
U0 OffsetPosTranslator_toInt(IPosTranslator *base,I32 *x,I32 *y,I32 *z) { OffsetPosTranslator *self=base; *x+=self->x(I32); *y+=self->y(I32); *z+=self->z(I32); }
U0 OffsetPosTranslator_toFloat(IPosTranslator *base,F32 *x,F32 *y,F32 *z) { OffsetPosTranslator *self=base; *x+=self->x; *y+=self->y; *z+=self->z; }
U0 OffsetPosTranslator_fromInt(IPosTranslator *base,I32 *x,I32 *y,I32 *z) { OffsetPosTranslator *self=base; *x-=self->x(I32); *y-=self->y(I32); *z-=self->z(I32); }
U0 OffsetPosTranslator_fromFloat(IPosTranslator *base,F32 *x,F32 *y,F32 *z) { OffsetPosTranslator *self=base; *x-=self->x; *y-=self->y; *z-=self->z; }
U0 OffsetPosTranslator_Init(OffsetPosTranslator *self) {
 self->x=0; self->y=0; self->z=0;
 self->toIntFn=&OffsetPosTranslator_toInt; self->toFloatFn=&OffsetPosTranslator_toFloat;
 self->fromIntFn=&OffsetPosTranslator_fromInt; self->fromFloatFn=&OffsetPosTranslator_fromFloat;
}

#endif


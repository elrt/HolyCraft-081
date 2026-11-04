// Batch 002. Source: minecraftpe/headers/util/IPosTranslator.hpp
#ifndef MCPE_HEADERS_UTIL_IPOSTRANSLATOR_HPP
#define MCPE_HEADERS_UTIL_IPOSTRANSLATOR_HPP
class IPosTranslator {
 U0 (*toIntFn)(IPosTranslator *self,I32 *x,I32 *y,I32 *z);
 U0 (*toFloatFn)(IPosTranslator *self,F32 *x,F32 *y,F32 *z);
 U0 (*fromIntFn)(IPosTranslator *self,I32 *x,I32 *y,I32 *z);
 U0 (*fromFloatFn)(IPosTranslator *self,F32 *x,F32 *y,F32 *z);
};
U0 IPosTranslator_toInt(IPosTranslator *self,I32 *x,I32 *y,I32 *z) { self->toIntFn(self,x,y,z); }
U0 IPosTranslator_toFloat(IPosTranslator *self,F32 *x,F32 *y,F32 *z) { self->toFloatFn(self,x,y,z); }
U0 IPosTranslator_fromInt(IPosTranslator *self,I32 *x,I32 *y,I32 *z) { self->fromIntFn(self,x,y,z); }
U0 IPosTranslator_fromFloat(IPosTranslator *self,F32 *x,F32 *y,F32 *z) { self->fromFloatFn(self,x,y,z); }

#endif


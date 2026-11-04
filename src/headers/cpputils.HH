// Batch 004. Source: minecraftpe/headers/cpputils.hpp
#ifndef MCPE_HEADERS_CPPUTILS_HPP
#define MCPE_HEADERS_CPPUTILS_HPP
F64 getTimeS(); I64 getEpochTimeS(); I32 getTimeMs(); I32 getRawTimeS(); U0 sleepMs(I32 milliseconds);
U0 splitString(MCString *text,U8 delimiter,MCVector *out);
I32 recursiveDelete(U8 *path); Bool DeleteDirectory(MCString *path,Bool unused);
U0 safeRemove(U0 **pointer,U0 (*destroy)(U0 *object));
U0 safeStopAndRemove(U0 **pointer,U0 (*stop)(U0 *object),U0 (*release)(U0 *object));
F32 vcvts_n_f32_s32(I32 value,U32 shift);

#endif


// Batch 002. Source: minecraftpe/headers/util/CMutex.hpp
#ifndef MCPE_HEADERS_UTIL_CMUTEX_HPP
#define MCPE_HEADERS_UTIL_CMUTEX_HPP
class CMutex { MCNativeMutex mutex; };
U0 CMutex_Init(CMutex *self); U0 CMutex_lock(CMutex *self); U0 CMutex_unlock(CMutex *self); U0 CMutex_Destroy(CMutex *self);

#endif


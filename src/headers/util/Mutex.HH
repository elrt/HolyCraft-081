// Batch 002. Source: minecraftpe/headers/util/Mutex.hpp
#ifndef MCPE_HEADERS_UTIL_MUTEX_HPP
#define MCPE_HEADERS_UTIL_MUTEX_HPP
class Mutex { MCNativeMutex mutex; };
U0 Mutex_Init(Mutex *self) { pthread_mutex_init(MC_MutexAddress(&self->mutex),NULL); }
U0 Mutex_Destroy(Mutex *self) { pthread_mutex_destroy(MC_MutexAddress(&self->mutex)); }

#endif


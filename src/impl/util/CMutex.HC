// Batch 002. Source: minecraftpe/impl/util/CMutex.cpp
U0 CMutex_Init(CMutex *self) { pthread_mutex_init(MC_MutexAddress(&self->mutex),NULL); }
U0 CMutex_lock(CMutex *self) { pthread_mutex_lock(MC_MutexAddress(&self->mutex)); }
U0 CMutex_unlock(CMutex *self) { pthread_mutex_unlock(MC_MutexAddress(&self->mutex)); }
U0 CMutex_Destroy(CMutex *self) { pthread_mutex_destroy(MC_MutexAddress(&self->mutex)); }


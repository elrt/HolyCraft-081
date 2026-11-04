#ifndef MCPE_BATCH005_THREAD_SUPPORT
#define MCPE_BATCH005_THREAD_SUPPORT
class MCNativeCond { U64 opaque[6]; };
pthread_cond_t *MC_CondAddress(MCNativeCond *self) { return self(pthread_cond_t*); }
extern "c" I64 sysconf(I32 name);
U0 MCThread_Check(I32 result) { if(result) { printf("pthread error %d\n",result);exit(88); } }
#endif

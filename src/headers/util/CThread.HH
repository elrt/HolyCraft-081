// Batch 004. Source: minecraftpe/headers/util/CThread.hpp
#ifndef MCPE_HEADERS_UTIL_CTHREAD_HPP
#define MCPE_HEADERS_UTIL_CTHREAD_HPP
class MCNativeThreadAttr { U64 opaque[7]; };
extern "c" I32 pthread_attr_init(MCNativeThreadAttr *attr);
extern "c" I32 pthread_attr_setdetachstate(MCNativeThreadAttr *attr,I32 state);
extern "c" I32 pthread_attr_destroy(MCNativeThreadAttr *attr);
class CThread { pthread_t *field_8; U0 *(*function)(U0 *args); MCNativeThreadAttr field_C; I32 createError; };
U0 CThread_Init(CThread *self,U0 *(*function)(U0 *args),U0 *args);
I32 CThread_join(CThread *self); I32 CThread_sleep(U32 milliseconds); U0 CThread_Destroy(CThread *self);

#endif


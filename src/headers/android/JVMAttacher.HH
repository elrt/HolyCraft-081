// Batch 019: minecraftpe/headers/android/JVMAttacher.hpp.
// Adapter is not a JNI ABI: host callbacks must call the real JavaVM methods.
#ifndef MCPE_JVM_ATTACHER_HH
#define MCPE_JVM_ATTACHER_HH
class MCJavaVMHost019 {U0 *vm;I32 (*getEnv)(U0 *vm,U0 **env,I32 version);I32 (*attach)(U0 *vm,U0 **env);I32 (*detach)(U0 *vm);};
class JVMAttacher {MCJavaVMHost019 *host;U0 *env;Bool attached;};
U0 JVMAttacher_Init(JVMAttacher *self,MCJavaVMHost019 *host);
U0 JVMAttacher_forceDetach(JVMAttacher *self);
U0 JVMAttacher_Destroy(JVMAttacher *self);
#endif

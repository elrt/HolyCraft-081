// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class SoundEngine {SoundSystemAL *system;SoundRepository sounds;F32 x,y,z,angle,invDistance,volume;};

U0 SoundEngine_Init(SoundEngine *s,SoundSystemAL *system,F32 distance);
U0 SoundEngine_Destroy(SoundEngine *s);
F32 SoundEngine_getVolumeMult(SoundEngine *s,F32 x,F32 y,F32 z);
U0 SoundEngine_addPCM(SoundEngine *s,U8 *name,U8 *pcm);
Bool SoundEngine_play(SoundEngine *s,U8 *name,F32 x,F32 y,F32 z,F32 gain,F32 pitch,Bool ui);
U0 SoundEngine_update(SoundEngine *s,F32 oldX,F32 oldY,F32 oldZ,F32 x,F32 y,F32 z,F32 oldYaw,F32 yaw,F32 partial);
I32 SoundEngine_registerDefaults(SoundEngine *s,U0 *ctx,U8 *(*resolve)(U0*,U8*));

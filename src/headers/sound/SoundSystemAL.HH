// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class SoundSystemAL {MCAudio024 *host;Bool ready,active[4],queued[4];I32 playing,currentVolume;F32 listenerX,listenerY,listenerZ;};
U0 SoundSystemAL_Init(SoundSystemAL *s,MCAudio024 *host);
U0 SoundSystemAL_removeStoppedSounds(SoundSystemAL *s);
Bool SoundSystemAL_playAt(SoundSystemAL *s,SoundDesc *sound,F32 x,F32 y,F32 z,F32 gain,F32 pitch);
U0 SoundSystemAL_queueFinished(SoundSystemAL *s,I32 slot);
U0 SoundSystemAL_setListenerAngle(SoundSystemAL *s,F32 angle);
U0 SoundSystemAL_Destroy(SoundSystemAL *s);

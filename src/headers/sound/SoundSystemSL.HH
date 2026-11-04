// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class SoundSystemSL {MCAudio024 *host;Bool ready,active[4],queued[4];I32 playing,currentVolume;F32 listenerX,listenerY,listenerZ;};
U0 SoundSystemSL_Init(SoundSystemSL *s,MCAudio024 *host);
U0 SoundSystemSL_removeStoppedSounds(SoundSystemSL *s);
Bool SoundSystemSL_playAt(SoundSystemSL *s,SoundDesc *sound,F32 x,F32 y,F32 z,F32 gain,F32 pitch);
U0 SoundSystemSL_queueFinished(SoundSystemSL *s,I32 slot);
U0 SoundSystemSL_setListenerAngle(SoundSystemSL *s,F32 angle);
U0 SoundSystemSL_Destroy(SoundSystemSL *s);

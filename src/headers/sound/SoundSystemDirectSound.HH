// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class SoundSystemDirectSound {MCAudio024 *host;Bool ready,active[4],queued[4];I32 playing,currentVolume;F32 listenerX,listenerY,listenerZ;};
U0 SoundSystemDirectSound_Init(SoundSystemDirectSound *s,MCAudio024 *host);
U0 SoundSystemDirectSound_removeStoppedSounds(SoundSystemDirectSound *s);
Bool SoundSystemDirectSound_playAt(SoundSystemDirectSound *s,SoundDesc *sound,F32 x,F32 y,F32 z,F32 gain,F32 pitch);
U0 SoundSystemDirectSound_queueFinished(SoundSystemDirectSound *s,I32 slot);
U0 SoundSystemDirectSound_setListenerAngle(SoundSystemDirectSound *s,F32 angle);
U0 SoundSystemDirectSound_Destroy(SoundSystemDirectSound *s);

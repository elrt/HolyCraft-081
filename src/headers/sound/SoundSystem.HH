// Batch 005. Source: minecraftpe/headers/sound/SoundSystem.hpp
#ifndef MCPE_HEADERS_SOUND_SOUNDSYSTEM_HPP
#define MCPE_HEADERS_SOUND_SOUNDSYSTEM_HPP
class SoundSystem { U0 *context;Bool (*available)(U0 *c);U0 (*enabled)(U0 *c,Bool value);U0 (*position)(U0 *c,F32 x,F32 y,F32 z);U0 (*angle)(U0 *c,F32 value);U0 (*loadFn)(U0 *c,MCString *name);U0 (*playFn)(U0 *c,MCString *name);U0 (*pauseFn)(U0 *c,MCString *name);U0 (*stopFn)(U0 *c,MCString *name);U0 (*at)(U0 *c,SoundDesc *sound,F32 x,F32 y,F32 z,F32 volume,F32 pitch);U0 (*destroy)(U0 *c); };
U0 SoundSystem_Init(SoundSystem *self) { memset(self,0,sizeof(SoundSystem)); }
Bool SoundSystem_isAvailable(SoundSystem *self) { if(self->available)return self->available(self->context);return FALSE; }
U0 SoundSystem_Destroy(SoundSystem *self) { if(self->destroy)self->destroy(self->context); }
U0 SoundSystem_enable(SoundSystem *self,Bool value) { if(self->enabled)self->enabled(self->context,value); }
U0 SoundSystem_setListenerPos(SoundSystem *self,F32 x,F32 y,F32 z) { if(self->position)self->position(self->context,x,y,z); }
U0 SoundSystem_setListenerAngle(SoundSystem *self,F32 value) { if(self->angle)self->angle(self->context,value); }
U0 SoundSystem_load(SoundSystem *self,MCString *name) { if(self->loadFn)self->loadFn(self->context,name); }
U0 SoundSystem_play(SoundSystem *self,MCString *name) { if(self->playFn)self->playFn(self->context,name); }
U0 SoundSystem_pause(SoundSystem *self,MCString *name) { if(self->pauseFn)self->pauseFn(self->context,name); }
U0 SoundSystem_stop(SoundSystem *self,MCString *name) { if(self->stopFn)self->stopFn(self->context,name); }
U0 SoundSystem_playAt(SoundSystem *self,SoundDesc *sound,F32 x,F32 y,F32 z,F32 volume,F32 pitch) { if(self->at)self->at(self->context,sound,x,y,z,volume,pitch); }

#endif


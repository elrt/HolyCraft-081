// Batch 005. Source: minecraftpe/headers/sound/SoundDesc.hpp
#ifndef MCPE_HEADERS_SOUND_SOUNDDESC_HPP
#define MCPE_HEADERS_SOUND_SOUNDDESC_HPP
class SoundDesc { U8 *field_0;I32 field_4,channels,bytesPerSample,sampleRate,length;MCString field_18;U8 *pcmData; };
U0 SoundDesc_Init(SoundDesc *self) { memset(self,0,sizeof(SoundDesc));MCString_Init(&self->field_18); }
U0 SoundDesc_InitPCM(SoundDesc *self,U8 *pcm) { SoundDesc_Init(self);self->pcmData=pcm;if(!pcm)return;I32 *header=pcm(I32*);self->channels=header[0];self->bytesPerSample=header[1];self->sampleRate=header[2];self->length=header[3];self->field_0=pcm+16;self->field_4=self->length*self->channels*self->bytesPerSample; }
U0 SoundDesc_CopyInit(SoundDesc *self,SoundDesc *other) { *self=*other;MCString_CopyInit(&self->field_18,&other->field_18); }
U0 SoundDesc_Destroy(SoundDesc *self) { MCString_Destroy(&self->field_18); }
U0 SoundDesc_Assign(SoundDesc *self,SoundDesc *other) { if(self==other)return;SoundDesc_Destroy(self);SoundDesc_CopyInit(self,other); }

#endif


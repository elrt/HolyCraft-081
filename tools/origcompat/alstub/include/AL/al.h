#pragma once
/* Minimal no-op OpenAL stub: only to build the original MCPE 0.8.1 decomp for headless world testing. */
#ifdef __cplusplus
extern "C" {
#define AL_VELOCITY 0x1006
#endif
typedef int ALenum; typedef int ALint; typedef unsigned int ALuint; typedef float ALfloat; typedef int ALsizei; typedef char ALboolean; typedef void ALvoid; typedef char ALchar;
#define AL_NO_ERROR 0
#define AL_FALSE 0
#define AL_TRUE 1
#define AL_SOURCE_STATE 0x1010
#define AL_PLAYING 0x1012
#define AL_STOPPED 0x1014
#define AL_BUFFER 0x1009
#define AL_PITCH 0x1003
#define AL_GAIN 0x100A
#define AL_LOOPING 0x1007
#define AL_POSITION 0x1004
#define AL_ORIENTATION 0x100F
#define AL_REFERENCE_DISTANCE 0x1020
#define AL_MAX_DISTANCE 0x1023
#define AL_ROLLOFF_FACTOR 0x1021
#define AL_SOURCE_RELATIVE 0x202
#define AL_LINEAR_DISTANCE_CLAMPED 0xD004
#define AL_FORMAT_MONO8 0x1100
#define AL_FORMAT_MONO16 0x1101
#define AL_FORMAT_STEREO8 0x1102
#define AL_FORMAT_STEREO16 0x1103
ALenum alGetError(void);
void alDeleteBuffers(ALsizei,const ALuint*); void alDeleteSources(ALsizei,const ALuint*);
void alGenBuffers(ALsizei,ALuint*); void alGenSources(ALsizei,ALuint*);
void alDistanceModel(ALenum); void alListenerfv(ALenum,const ALfloat*); void alListener3f(ALenum,ALfloat,ALfloat,ALfloat); void alListenerf(ALenum,ALfloat);
void alGetSourcei(ALuint,ALenum,ALint*); void alSourcei(ALuint,ALenum,ALint); void alSourcef(ALuint,ALenum,ALfloat); void alSource3f(ALuint,ALenum,ALfloat,ALfloat,ALfloat);
void alBufferData(ALuint,ALenum,const ALvoid*,ALsizei,ALsizei); void alSourcePlay(ALuint); void alSourceStop(ALuint);
#ifdef __cplusplus
}
#define AL_VELOCITY 0x1006
#endif

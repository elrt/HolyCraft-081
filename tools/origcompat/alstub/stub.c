#include <AL/al.h>
#include <AL/alc.h>
#include <stddef.h>
static int dummy;
ALenum alGetError(void){return 0;}
void alDeleteBuffers(ALsizei n,const ALuint*b){} void alDeleteSources(ALsizei n,const ALuint*b){}
void alGenBuffers(ALsizei n,ALuint*b){for(int i=0;i<n;i++)b[i]=i+1;} void alGenSources(ALsizei n,ALuint*b){for(int i=0;i<n;i++)b[i]=i+1;}
void alDistanceModel(ALenum e){} void alListenerfv(ALenum e,const ALfloat*v){} void alListener3f(ALenum e,ALfloat a,ALfloat b,ALfloat c){} void alListenerf(ALenum e,ALfloat a){}
void alGetSourcei(ALuint s,ALenum e,ALint*v){*v=AL_STOPPED;} void alSourcei(ALuint s,ALenum e,ALint v){} void alSourcef(ALuint s,ALenum e,ALfloat v){} void alSource3f(ALuint s,ALenum e,ALfloat a,ALfloat b,ALfloat c){}
void alBufferData(ALuint b,ALenum f,const ALvoid*d,ALsizei n,ALsizei r){} void alSourcePlay(ALuint s){} void alSourceStop(ALuint s){}
ALCdevice *alcOpenDevice(const ALCchar*n){return (ALCdevice*)&dummy;} ALCboolean alcCloseDevice(ALCdevice*d){return 1;}
ALCcontext *alcCreateContext(ALCdevice*d,const ALCint*a){return (ALCcontext*)&dummy;} void alcDestroyContext(ALCcontext*c){} ALCboolean alcMakeContextCurrent(ALCcontext*c){return 1;}
const ALCchar *alcGetString(ALCdevice*d,ALCenum e){return "stub";}

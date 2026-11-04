#pragma once
#ifdef __cplusplus
extern "C" {
#endif
typedef struct ALCdevice ALCdevice; typedef struct ALCcontext ALCcontext; typedef char ALCchar; typedef int ALCint; typedef int ALCenum; typedef char ALCboolean;
#define ALC_DEVICE_SPECIFIER 0x1005
#define ALC_DEFAULT_DEVICE_SPECIFIER 0x1004
ALCdevice *alcOpenDevice(const ALCchar*); ALCboolean alcCloseDevice(ALCdevice*);
ALCcontext *alcCreateContext(ALCdevice*,const ALCint*); void alcDestroyContext(ALCcontext*); ALCboolean alcMakeContextCurrent(ALCcontext*);
const ALCchar *alcGetString(ALCdevice*,ALCenum);
#ifdef __cplusplus
}
#endif

#ifndef MCPE_BATCH011_PARTICLE_SUPPORT
#define MCPE_BATCH011_PARTICLE_SUPPORT
class Particle;
class MCParticleEntity011 {F32 x,y,z,width,height;I32 fire;Bool alive,dead,onFire;};
class MCParticleHost011 {U0 *host;Random *sharedRandom;F32 viewX,viewY,viewZ,xOff,yOff,zOff;F32 (*random)(U0 *);U0 (*reset)(U0 *,Particle *);U0 (*move)(U0 *,Particle *,F32,F32,F32);U0 (*remove)(U0 *,Particle *);F32 (*brightness)(U0 *,Particle *,F32);Bool (*isWater)(U0 *,I32,I32,I32);U0 (*spawn)(U0 *,I32,F32,F32,F32,F32,F32,F32,I32);TextureUVCoordinateSet *(*itemTexture)(U0 *,I32);TextureUVCoordinateSet *(*tileTexture)(U0 *,I32,I32);F32 (*tileGravity)(U0 *,I32);I32 (*tileColor)(U0 *,I32,I32,I32,I32);I32 grassID;U0 (*color)(U0 *,F32,F32,F32);U0 (*vertex)(U0 *,F32,F32,F32,F32,F32);};
#endif

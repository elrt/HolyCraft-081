// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class MCParticleBackend024 {U0 *ctx;Particle *(*create)(U0*,I32);U0 (*destroy)(U0*,Particle*);};
class ParticleEngine {MCPtrVector active,pool[16];MCParticleBackend024 *host;};

U0 ParticleEngine_Init(ParticleEngine *s,MCParticleBackend024 *host);
Particle *ParticleEngine_get(ParticleEngine *s,I32 type);
Bool ParticleEngine_add(ParticleEngine *s,Particle *p);
Particle *ParticleEngine_instance(ParticleEngine *s,I32 type,F32 x,F32 y,F32 z,F32 mx,F32 my,F32 mz,I32 data);
U0 ParticleEngine_tick(ParticleEngine *s);
U0 ParticleEngine_clear(ParticleEngine *s);
U0 ParticleEngine_Destroy(ParticleEngine *s);

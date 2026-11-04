// Batch023: level/Explosion; explicit simulation ABI, see docs/BATCH023.md.
class Explosion {MCWorld023 *w;MCBody023 *source;F32 x,y,z,radius;Bool fire;MCVector affected;Random rng;};
U0 Explosion_Init(Explosion*,MCWorld023*,MCBody023*,F32,F32,F32,F32,Bool);U0 Explosion_Destroy(Explosion*);U0 Explosion_explode(Explosion*);U0 Explosion_finalizeExplosion(Explosion*);

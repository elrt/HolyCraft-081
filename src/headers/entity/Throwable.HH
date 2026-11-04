// Batch023: entity/Throwable; explicit simulation ABI, see docs/BATCH023.md.
class Throwable: MCBody023 {MCBody023 *owner;I32 tileX,tileY,tileZ,inTile,shake,groundTicks,airTicks;Bool inGround;F32 gravity;U0 *hitContext;U0 (*onHit)(U0*,Throwable*,MCBody023*,Vec3*);};
U0 Throwable_Init(Throwable*,MCWorld023*,MCBody023*);U0 Throwable_shoot(Throwable*,F32,F32,F32,F32,F32);U0 Throwable_lerpMotion(Throwable*,F32,F32,F32);U0 Throwable_tick(Throwable*);U0 Throwable_save(Throwable*,CompoundTag*);U0 Throwable_load(Throwable*,CompoundTag*);

// Batch023: entity/Creeper; explicit simulation ABI, see docs/BATCH023.md.
class Creeper: MCBody023 {I32 swell,previousSwell,swellDirection;Bool holdGround;};
U0 Creeper_Init(Creeper*,MCWorld023*);F32 Creeper_getSwelling(Creeper*,F32);U0 Creeper_checkCantSeeTarget(Creeper*);Bool Creeper_checkHurtTarget(Creeper*,F32);U0 Creeper_tick(Creeper*);Bool Creeper_interact(Creeper*,MCPlayer023*);

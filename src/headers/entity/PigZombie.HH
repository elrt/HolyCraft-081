// Batch023: entity/PigZombie; explicit simulation ABI, see docs/BATCH023.md.
class PigZombie: MCBody023 {I32 anger,soundDelay,targetDelay,attackTarget;};
U0 PigZombie_Init(PigZombie*,MCWorld023*);I32 PigZombie_alert(PigZombie*,MCBody023*);U0 PigZombie_tick(PigZombie*);U0 PigZombie_save(PigZombie*,CompoundTag*);U0 PigZombie_load(PigZombie*,CompoundTag*);Bool PigZombie_hurt(PigZombie*,MCBody023*,I32);

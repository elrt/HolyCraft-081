// Batch023: entity/Arrow; explicit simulation ABI, see docs/BATCH023.md.
class Arrow: Throwable {I32 inData;Bool playerOwned,critical;};
U0 Arrow_Init(Arrow*,MCWorld023*,MCBody023*);U0 Arrow_shoot(Arrow*,F32,F32,F32,F32,F32);U0 Arrow_tick(Arrow*);U0 Arrow_playerTouch(Arrow*,MCPlayer023*);U0 Arrow_save(Arrow*,CompoundTag*);U0 Arrow_load(Arrow*,CompoundTag*);

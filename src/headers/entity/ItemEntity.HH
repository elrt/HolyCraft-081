// Batch023: entity/ItemEntity; explicit simulation ABI, see docs/BATCH023.md.
class ItemEntity: MCBody023 {ItemInstance item;I32 pickupDelay,itemAge,healthValue,lifetime,ticks;F32 hover;};
U0 ItemEntity_Init(ItemEntity*,MCWorld023*,F32,F32,F32,ItemInstance*,U32);Bool ItemEntity_checkInTile(ItemEntity*);U0 ItemEntity_tick(ItemEntity*);Bool ItemEntity_hurt(ItemEntity*,I32);U0 ItemEntity_playerTouch(ItemEntity*,MCPlayer023*);U0 ItemEntity_save(ItemEntity*,CompoundTag*);U0 ItemEntity_load(ItemEntity*,CompoundTag*);

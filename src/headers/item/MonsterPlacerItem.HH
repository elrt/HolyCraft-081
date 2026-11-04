// Batch026 partial source API; not original C++ ABI.
class MonsterPlacerItem {MCItemDef023 base;TextureUVCoordinateSet icons[4];MCSpawnHost026 host;I32 fence;};
U0 MonsterPlacerItem_Init(MonsterPlacerItem *s,I32 id,MCSpawnHost026 *host,I32 fence);
Bool MonsterPlacerItem_spawnMobAt(MonsterPlacerItem *s,Level *level,I32 type,F32 x,F32 y,F32 z);
Bool MonsterPlacerItem_useOn(MonsterPlacerItem *s,ItemInstance *item,Player *player,I32 x,I32 y,I32 z,I32 face);

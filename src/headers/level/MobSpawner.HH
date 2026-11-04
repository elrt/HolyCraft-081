// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class MobSpawner {Random babyRandom;U8 chunksToPoll[256];I32 playerCursor;};

U0 MobSpawner_Init(MobSpawner *s);
U0 MobSpawner_getRandomPosWithin(Level *level,I32 x,I32 z,I32 *out);
Bool MobSpawner_isSpawnPositionOk(Level *level,Bool water,I32 x,I32 y,I32 z);
U0 MobSpawner_makeBabyMob(MobSpawner *s,Mob *mob,F32 chance);
Bool MobSpawner_addMob(MobSpawner *s,Level *level,Mob *mob,F32 x,F32 y,F32 z,F32 yaw,F32 pitch,Bool force,Bool canSpawn);
U0 MobSpawner_pollChunks(MobSpawner *s,Bool animals,F32 playerX,F32 playerZ);

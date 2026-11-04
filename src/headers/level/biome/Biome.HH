// Batch 008: minecraftpe/headers/level/biome/Biome.hpp
#define MC_BIOME_BASE 0
#define MC_BIOME_FOREST 1
#define MC_BIOME_RAINFOREST 2
#define MC_BIOME_TAIGA 3
#define MC_BIOME_FLAT 4
#define MC_BIOME_SWAMP 5
class BiomeMobSpawnerData { I32 rarity,mobtype,min,max; };
class Biome { MCVector monsterVec,creatureVec,waterCreatureVec;MCString biomeName;I32 color;U8 topBlock,fillerBlock;I32 leafColor;F32 temperature,downfall;I32 variant; };
Biome *Biome_rainForest,*Biome_swampland,*Biome_seasonalForest,*Biome_forest,*Biome_savanna,*Biome_shrubland,*Biome_taiga,*Biome_desert,*Biome_plains,*Biome_iceDesert,*Biome_tundra;
Biome *Biome_map[4096];MCVector Biome_emptyMobList;I32 Biome_defaultTotalEnemyWeight,Biome_defaultTotalFriendlyWeight;Bool Biome_initialized;
// IDs are registered by host before init. Existing feature registry owns grass,dirt,sand.
I32 Biome_tallgrassID;
U0 Biome_Init(Biome *self);U0 Biome_Destroy(Biome *self);Feature *Biome_getTreeFeature(Biome *self,Random *r);Feature *Biome_getGrassFeature(Biome *self,Random *r);
F32 Biome_getTemperature(Biome *self);F32 Biome_adjustScale(Biome *self,F32 f);F32 Biome_adjustDepth(Biome *self,F32 f);U0 Biome_getSkyColor(Biome *self,F32 t,Color4 *out);MCVector *Biome_getMobs(Biome *self,MobCategory *category);F32 Biome_getCreatureProbability(Biome *self);
Biome *Biome_clearMobs(Biome *self,Bool creature,Bool water,Bool monsters);Biome *Biome_setColor(Biome *self,I32 color);Biome *Biome_setLeafColor(Biome *self,I32 color);Biome *Biome_setName(Biome *self,U8 *name);Biome *Biome_setSnowCovered(Biome *self);Biome *Biome_setTemperatureAndDownfall(Biome *self,F32 t,F32 d);
U0 Biome_recalc();U0 Biome_initBiomes();U0 Biome_teardownBiomes();Biome *Biome_getBiome(F32 temp,F32 rain);Biome *Biome__getBiome(F32 temp,F32 rain);

// Batch 008: minecraftpe/headers/entity/MobCategory.hpp
class MobCategory { I32 id,minCountInChunkMaybe,maxCountInChunkMaybe;Material *material;I8 field_10; };
MobCategory MobCategory_monster,MobCategory_creature,MobCategory_waterCreature;
MobCategory *MobCategory_values[3];I32 MobCategory_numValues=3;
U0 MobCategory_InitValues();U0 MobCategory_initMobCategories();

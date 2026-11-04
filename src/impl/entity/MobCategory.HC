// Batch 008: minecraftpe/impl/entity/MobCategory.cpp
U0 MobCategory_InitValues() { memset(&MobCategory_monster,0,sizeof(MobCategory));memset(&MobCategory_creature,0,sizeof(MobCategory));memset(&MobCategory_waterCreature,0,sizeof(MobCategory));
 MobCategory_monster.id=1;MobCategory_monster.minCountInChunkMaybe=10;MobCategory_monster.maxCountInChunkMaybe=20;
 MobCategory_creature.id=2;MobCategory_creature.minCountInChunkMaybe=10;MobCategory_creature.maxCountInChunkMaybe=15;MobCategory_creature.field_10=1;
 MobCategory_waterCreature.id=3;MobCategory_waterCreature.minCountInChunkMaybe=5;MobCategory_waterCreature.maxCountInChunkMaybe=10;MobCategory_waterCreature.field_10=1;
 MobCategory_values[0]=&MobCategory_monster;MobCategory_values[1]=&MobCategory_creature;MobCategory_values[2]=&MobCategory_waterCreature;
}
U0 MobCategory_initMobCategories() { MobCategory_monster.material=Material_air;MobCategory_creature.material=Material_air;MobCategory_waterCreature.material=Material_water; }

// Batch 008: minecraftpe/impl/level/biome/Biome.cpp
U0 Biome_AddMob(MCVector *v,I32 rarity,I32 type,I32 min,I32 max) { BiomeMobSpawnerData d;d.rarity=rarity;d.mobtype=type;d.min=min;d.max=max;MCVector_Push(v,&d); }
U0 Biome_Init(Biome *self) { memset(self,0,sizeof(Biome));MCVector_Init(&self->monsterVec,sizeof(BiomeMobSpawnerData));MCVector_Init(&self->creatureVec,sizeof(BiomeMobSpawnerData));MCVector_Init(&self->waterCreatureVec,sizeof(BiomeMobSpawnerData));MCString_Init(&self->biomeName);
 self->topBlock=MC_featureTiles.grass;self->fillerBlock=MC_featureTiles.dirt;self->leafColor=0x4EE031;self->temperature=0.5;self->downfall=0.5;
 Biome_AddMob(&self->creatureVec,12,13,2,3);Biome_AddMob(&self->creatureVec,10,12,1,3);Biome_AddMob(&self->creatureVec,10,10,2,4);Biome_AddMob(&self->creatureVec,8,11,2,3);
 Biome_AddMob(&self->monsterVec,8,35,2,3);Biome_AddMob(&self->monsterVec,12,32,2,4);Biome_AddMob(&self->monsterVec,6,34,1,3);Biome_AddMob(&self->monsterVec,4,33,1,1);
 Biome_defaultTotalEnemyWeight=30;Biome_defaultTotalFriendlyWeight=40;
}
U0 Biome_Destroy(Biome *self) { MCVector_Destroy(&self->monsterVec);MCVector_Destroy(&self->creatureVec);MCVector_Destroy(&self->waterCreatureVec);MCString_Destroy(&self->biomeName); }
Feature *Biome_getTreeFeature(Biome *self,Random *r) {
 if(!r) {printf("Biome missing random\n");exit(91);}
 if(self->variant==MC_BIOME_FOREST) { if(Random_genrand_int32(r)%5) { Random_genrand_int32(r);TreeFeature *tree=MC_Alloc(sizeof(TreeFeature));TreeFeature_Init(tree,FALSE,0);return &tree->base; }BirchFeature *birch=MC_Alloc(sizeof(BirchFeature));BirchFeature_Init(birch,FALSE);return &birch->base; }
 if(self->variant==MC_BIOME_TAIGA) { if(Random_genrand_int32(r)%3) { SpruceFeature *spruce=MC_Alloc(sizeof(SpruceFeature));SpruceFeature_Init(spruce,FALSE);return &spruce->base; }PineFeature *pine=MC_Alloc(sizeof(PineFeature));PineFeature_Init(pine);return &pine->base; }
 Random_genrand_int32(r);TreeFeature *tree=MC_Alloc(sizeof(TreeFeature));TreeFeature_Init(tree,FALSE,0);return &tree->base;
}
Feature *Biome_getGrassFeature(Biome *self,Random *r) { TallgrassFeature *g=MC_Alloc(sizeof(TallgrassFeature));TallgrassFeature_Init(g,Biome_tallgrassID,1);return &g->base; }
F32 Biome_getTemperature(Biome *self) { return self->temperature; }
F32 Biome_adjustScale(Biome *self,F32 f) { return f; } F32 Biome_adjustDepth(Biome *self,F32 f) { return f; }
U0 Biome_getSkyColor(Biome *self,F32 t,Color4 *out) { F32 x=t/3.0;if(x< -1.0)x= -1.0;else if(x>1.0)x=1.0;Color4_fromHSB(0.62222-(x*0.05),x*0.1+0.5,1.0,out); }
MCVector *Biome_getMobs(Biome *self,MobCategory *c) { if(c==&MobCategory_monster)return &self->monsterVec;if(c==&MobCategory_creature)return &self->creatureVec;if(c==&MobCategory_waterCreature)return &self->waterCreatureVec;return &Biome_emptyMobList; }
F32 Biome_getCreatureProbability(Biome *self) { return 0.08; }
Biome *Biome_clearMobs(Biome *self,Bool creature,Bool water,Bool monsters) { if(creature)self->creatureVec.size=0;if(water)self->waterCreatureVec.size=0;if(monsters)self->monsterVec.size=0;return self; }
Biome *Biome_setColor(Biome *self,I32 c) { self->color=c;return self; }Biome *Biome_setLeafColor(Biome *self,I32 c) { self->leafColor=c;return self; }
Biome *Biome_setName(Biome *self,U8 *name) { MCString s;MCString_FromC(&s,name);MCString_Assign(&self->biomeName,&s);MCString_Destroy(&s);return self; }
Biome *Biome_setSnowCovered(Biome *self) { return self; }
Biome *Biome_setTemperatureAndDownfall(Biome *self,F32 t,F32 d) { self->temperature=t;self->downfall=d;return self; }
Biome *Biome__getBiome(F32 temp,F32 rain) {
 if(temp<0.1)return Biome_tundra;F32 r=rain*temp;
 if(r<0.2) { if(temp<0.5)return Biome_tundra;if(temp<0.95)return Biome_savanna;return Biome_desert; }
 if(r>0.5 && temp<0.7)return Biome_swampland;if(temp<0.5)return Biome_taiga;
 if(temp<0.97) { if(r<0.35)return Biome_shrubland;return Biome_forest; }
 if(r<0.45)return Biome_plains;if(r<0.9)return Biome_seasonalForest;return Biome_rainForest;
}
U0 Biome_recalc() { I32 i,j;for(i=0;i<64;i++)for(j=0;j<64;j++)Biome_map[j*64+i]=Biome__getBiome(i/63.0,j/63.0);Biome_desert->topBlock=MC_featureTiles.sand;Biome_desert->fillerBlock=MC_featureTiles.sand;Biome_iceDesert->topBlock=MC_featureTiles.sand;Biome_iceDesert->fillerBlock=MC_featureTiles.sand; }
Biome *Biome_New(I32 variant,U8 *name,I32 color,I32 leaf,F32 temp,F32 rain) { Biome *b=MC_Alloc(sizeof(Biome));Biome_Init(b);b->variant=variant;Biome_setName(b,name);b->color=color;b->leafColor=leaf;b->temperature=temp;b->downfall=rain;return b; }
U0 Biome_initBiomes() {
 if(Biome_initialized) {printf("Biomes already initialized\n");exit(91);} MCVector_Init(&Biome_emptyMobList,sizeof(BiomeMobSpawnerData));
 Biome_rainForest=Biome_New(MC_BIOME_RAINFOREST,"Rainforest",0x537B09,0x537B09,1.2,0.9);
 Biome_swampland=Biome_New(MC_BIOME_SWAMP,"Swampland",0x7F9B2,0x8BAF48,0.8,0.9);
 Biome_seasonalForest=Biome_New(MC_BIOME_BASE,"Seasonal Forest",0x56621,0x4EE031,0.5,0.5);
 Biome_forest=Biome_New(MC_BIOME_FOREST,"Forest",0x56621,0x4EBA31,0.7,0.8);
 Biome_savanna=Biome_New(MC_BIOME_FLAT,"Savanna",0xD9E023,0x4EE031,0.8,0.4);
 Biome_shrubland=Biome_New(MC_BIOME_BASE,"Shrubland",0xA1AD20,0x4EE031,0.5,0.5);
 Biome_taiga=Biome_New(MC_BIOME_TAIGA,"Taiga",0xB6659,0x4EBA3,0.05,0.8);
 Biome_desert=Biome_New(MC_BIOME_FLAT,"Desert",0xFA9418,0x4EE031,2.0,0.0);Biome_clearMobs(Biome_desert,TRUE,TRUE,FALSE);
 Biome_plains=Biome_New(MC_BIOME_FLAT,"Plains",0x8DB360,0x4EE031,0.8,0.4);
 Biome_iceDesert=Biome_New(MC_BIOME_FLAT,"Ice Desert",0xFFFFFF,0xC4D339,0.0,0.5);Biome_clearMobs(Biome_iceDesert,TRUE,FALSE,FALSE);
 Biome_tundra=Biome_New(MC_BIOME_BASE,"Tundra",0x163933,0xC4D339,0.05,0.8);
 Biome_recalc();Biome_initialized=TRUE;
}
U0 Biome_Free(Biome *b) { if(b){Biome_Destroy(b);free(b);} }
U0 Biome_teardownBiomes() { if(!Biome_initialized)return;Biome_Free(Biome_rainForest);Biome_Free(Biome_swampland);Biome_Free(Biome_seasonalForest);Biome_Free(Biome_forest);Biome_Free(Biome_savanna);Biome_Free(Biome_shrubland);Biome_Free(Biome_taiga);Biome_Free(Biome_desert);Biome_Free(Biome_plains);Biome_Free(Biome_iceDesert);Biome_Free(Biome_tundra);
 Biome_rainForest=NULL;Biome_swampland=NULL;Biome_seasonalForest=NULL;Biome_forest=NULL;Biome_savanna=NULL;Biome_shrubland=NULL;Biome_taiga=NULL;Biome_desert=NULL;Biome_plains=NULL;Biome_iceDesert=NULL;Biome_tundra=NULL;memset(Biome_map,0,sizeof(Biome_map));MCVector_Destroy(&Biome_emptyMobList);Biome_initialized=FALSE;
}
Biome *Biome_getBiome(F32 temp,F32 rain) { if(!Biome_initialized || !(temp>=0.0 && temp<=1.0) || !(rain>=0.0 && rain<=1.0)) {printf("Invalid biome coordinates\n");exit(91);}I32 x=(temp*63.0)(I32),y=(rain*63.0)(I32);return Biome_map[y*64+x]; }

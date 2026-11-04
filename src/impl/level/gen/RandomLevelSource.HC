// Partial source worldgen: original density, interpolation, surface; actual prior Perlin/BiomeSource. Decoration not silently stubbed.
U0 RandomLevelSource_buildSurfaces(RandomLevelSource *s,I32 chunkX,I32 chunkZ,U8 *blocks,Biome **biomes){
	I32 v9;			 
	F32 v10;			 
	I32 v11;		 
	I32 v12;		 
	F32 f;			 
	F32 v14;			 
	F32 v15;			 
	F32 f1;			 
	F32 v17;			 
	F32 v18;			 
	F32 f2;			 
	I32 fillerBlock; 
	I32 topBlock;	 
	U8* v22;		 
	I32 v23;		 
	I32 blockID_low; 
	I8 v25;			 
	I32 v26;		 
	I32 v27;		 
	I32 v28;		 
	I32 v29;		 
	F32* v30;			 
	Biome* v31;			 
	I32 v32;		 
	I32 v33;		 
	Biome** v34;		 

	F32 worldX = 16 * chunkX;
	F32 worldZ = 16 * chunkZ;
	PerlinNoise_getRegion3(&s->sandAndGravelNoise,s->sandNoises, worldX, worldZ, 0.0f, 16, 16, 1, 0.03125f, 0.03125f, 1.0f);
	PerlinNoise_getRegion3(&s->sandAndGravelNoise,s->gravelNoises, worldX, 109.01f, worldZ, 16, 1, 16, 0.03125f, 1.0f, 0.03125f);
	PerlinNoise_getRegion3(&s->octave4noise_2,s->field_7AD4, worldX, worldZ, 0.0f, 16, 16, 1, 0.0625f, 0.0625f, 0.0625f);

	
	
	
	for(I32 blockX = 0; blockX < 16; ++blockX) {
		for(I32 blockZ = 0; blockZ < 16; ++blockZ) {
			Biome* biome = biomes[blockX + (blockZ * 16)];
			Bool sand = s->sandNoises[blockX + (blockZ * 16)] + (Random_nextFloat(&s->random) * 0.2f) > 0.0f;
			Bool gravel = s->gravelNoises[blockX + (blockZ * 16)] + (Random_nextFloat(&s->random) * 0.2f) > 3.0f;
			I32 nextFloat = (((s->field_7AD4[blockX + (blockZ * 16)] / 3.0f) + 3.0f + (Random_nextFloat(&s->random) * 0.25f)))(I32);
			I32 i = -1;
			I32 b = biome->topBlock;
			I32 b2 = biome->fillerBlock;
			for(I32 blockY = 127; blockY >= 0; --blockY) {
				I32 index = (blockZ * 16 + blockX) * 128 + blockY;
				if((Random_genrand_int32(&s->random) % 5) >= blockY) {
					blocks[index] = s->ids.unbreakable;
				} else {
					I32 b3 = blocks[index];
					if(b3 == 0) {
						i = -1;
					} else if(b3 == s->ids.rock) {
						if(i == -1) {
							if(nextFloat > 0) {
								if(blockY >= 60 && blockY <= 65) {
									b = biome->topBlock;
									b2 = biome->fillerBlock;
									if(gravel) {
										b = 0;
										b2 = s->ids.gravel;
									}
									if(sand) {
										b = s->ids.sand;
										b2 = s->ids.sand;
									}
								}

							} else {
								b = 0;
								b2 = s->ids.rock;
							}

							if (blockY < 64 && b == 0) {
								b = s->ids.calmWater;
							}
							i = nextFloat;
							if (blockY >= 63) {
								blocks[index] = b;
							} else {
								blocks[index] = b2;
							}
						} else if (i > 0) {
							--i;
							blocks[index] = b2;
							if (i == 0 && b2 == s->ids.sand) {
								i = (Random_genrand_int32(&s->random) % 4);
								b2 = s->ids.sandStone;
							}
						}

					}
				}
			}
		}
	}
}
F32 *RandomLevelSource_getHeights(RandomLevelSource *s,F32 *heights,I32 chunkX,I32 chunkY,I32 chunkZ,I32 scaleX,I32 scaleY,I32 scaleZ){
	F32* rainfallNoises;	  
	F32* temperatureNoises; 
	F32 v14;				  
	I32 v15;			  
	I32 v16;			  
	I32 v17;			  
	I32 v18;			  
	I32 v19;			  
	I32 v20;			  
	I32 i;				  
	F32 v22;				  
	I32 v23;			  
	F32 v24;				  
	F32 v25;				  
	F32 v26;				  
	F32 v27;				  
	F32 v28;				  
	I32 v29;			  
	I32 v30;			  
	F32 v31;				  
	F32 v32;				  
	F32 v33;				  
	F32 v34;				  
	F32 v35;				  
	F32 v36;				  
	F32* v37;				  
	I32 v39;			  
	I32 v40;			  
	F32* v42;				  
	F32* v43;				  

	rainfallNoises = s->biomeSource->rainfall;
	temperatureNoises = s->biomeSource->temperatures;
	s->biomeNoises = PerlinNoise_getRegion2(&s->octave10noise_1,s->biomeNoises, chunkX, chunkZ, scaleX, scaleZ, 1.121f, 1.121f, 0.5f);
	v14 = (chunkY)(F32);
	s->depthNoises = PerlinNoise_getRegion2(&s->octave16noise_3,s->depthNoises, chunkX, chunkZ, scaleX, scaleZ, 200.0f, 200.0f, 0.5f);
	s->interpolationNoises = PerlinNoise_getRegion3(&s->octave8noise_1,s->interpolationNoises, (chunkX)(F32), v14, (chunkZ)(F32), scaleX, scaleY, scaleZ, 8.5552f, 4.2776f, 8.5552f);
	s->upperInterpolationNoises = PerlinNoise_getRegion3(&s->octave16noise_1,s->upperInterpolationNoises, (chunkX)(F32), v14, (chunkZ)(F32), scaleX, scaleY, scaleZ, 684.41f, 684.41f, 684.41f);
	s->lowerInterpolationNoises = PerlinNoise_getRegion3(&s->octave16noise_2,s->lowerInterpolationNoises, (chunkX)(F32), v14, (chunkZ)(F32), scaleX, scaleY, scaleZ, 684.41f, 684.41f, 684.41f);
	v40 = scaleY & ~(scaleY >> 31);
	v15 = 17 * (16 / scaleX / 2);
	v16 = 0;
	v17 = 0;
	v39 = 0;
	v42 = &rainfallNoises[v15];
	v43 = &temperatureNoises[v15];
	v18 = 0;
	while(v17 < scaleX) {
		v19 = 0;
		v20 = v18;
		for(i = 0; i < scaleZ; ++i) {
			v22 = 1.0f - ((v43[v16 + v19] * v42[v16 + v19]))(F32);
			v23 = i + v39;
			v24 = s->depthNoises[v23] / 8000.0f;
			v25 = ((((s->biomeNoises[v23] + 256.0f))(F32) * 0.0019531f))(F32) * ((1.0f - ((((v22 * v22))(F32) * ((v22 * v22))(F32)))(F32)))(F32);
			if(v25 > 1.0f) {
				v25 = 1.0f;
			}
			if(v24 < 0.0f) {
				v24 = -((v24 * 0.3f))(F32);
			}
			v26 = ((v24 * 3.0f))(F32) - 2.0f;
			if(v26 >= 0.0f) {
				if(v26 > 1.0f) {
					v26 = 1.0f;
				}
				v28 = v26 * 0.125f;
				if(v25 < 0.0f) {
					v25 = 0.0f;
				}
			} else {
				v27 = v26 * 0.5f;
				if(v27 < -1.0f) {
					v27 = -1.0f;
				}
				v25 = 0.0f;
				v28 = ((v27 / 1.4f))(F32) * 0.5f;
			}
			v29 = v20;
			v30 = 0;
			v31 = v25 + 0.5f;
			v32 = ((((((v28 * (scaleY)(F32)))(F32) * 0.0625f))(F32) * 4.0f))(F32) + (((scaleY)(F32) * 0.5f))(F32);
			while(v30 < scaleY) {
				v33 = (((((v30)(F32) - v32))(F32) * 12.0f))(F32) / v31;
				v34 = ((((s->interpolationNoises[v29] / 10.0f))(F32) + 1.0f))(F32) * 0.5f;
				if(v33 < 0.0f) {
					v33 = v33 * 4.0f;
				}
				v35 = s->upperInterpolationNoises[v29] * 0.0019531f;
				if(v34 >= 0.0f) {
					if(v34 > 1.0f) {
						v35 = s->lowerInterpolationNoises[v29] * 0.0019531f;
					} else {
						v35 = v35 + ((((((s->lowerInterpolationNoises[v29] * 0.0019531f))(F32) - v35))(F32) * v34))(F32);
					}
				}
				v36 = v35 - v33;
				if(scaleY - 3 <= v30) {
					v36 = ((((((4 - scaleY + v30))(F32) / 3.0f))(F32) * -10.0f))(F32) + ((v36 * ((1.0f - ((((4 - scaleY + v30))(F32) / 3.0f))(F32)))(F32)))(F32);
				}
				++v30;
				v37 = &heights[v29++];
				*v37 = v36;
			}
			v20 += v40;
			v19 +=  (16 / scaleX);
		}
		++v17;
		v18 += (scaleZ & ~(scaleZ >> 31)) * v40;
		v16 += ((16 / scaleX) << 6) / 4;
		v39 += scaleZ & ~(scaleZ >> 31);
	}
	return heights;
}
U0 RandomLevelSource_prepareHeights(RandomLevelSource *s,I32 a2,I32 a3,U8 *a4,U0 *a5,F32 *a6){
	
	
	F32* heights;	  
	F32* v7;		  
	F32* v8;		  
	F32* v9;		  
	F32 v10;		  
	I32 v11;		  
	F32 v12;		  
	I32 v13;		  
	F32 v14;		  
	U8* v15;	  
	F32 v16;		  
	I32 v17;		  
	I32 v18;		  
	I32 v19;		  
	I32 v20;		  
	U8* v21;	  
	F32 v22;		  
	I32 v23;		  
	I32 v24;		  
	U8* v25;	  
	F32 v26;		  
	I32 v27;		  
	I32 v29;		  
	I32 v30;		  
	I32 v31;		  
	F32 v32;		  
	F32 v33;		  
	I32 v34;		  
	F32 v35;		  
	F32 v36;		  
	I32 v37;		  
	F32 v38;		  
	F32 v39;		  
	F32 v40;		  
	F32 v41;		  
	F32* v42;		  
	U32 v43; 
	I32 v44;		  
	I32 v45;		  
	I32 v46;		  

	s->heights = heights = RandomLevelSource_getHeights(s,s->heights, 4 * a2, 0, 4 * a3, 5, 17, 5);
	v34 = 0;
	while(2) {
		v44 = 85 * v34;
		v45 = 85 * v34 + 340;
		v42 = a6;
		v46 = 0;
		while(2) {
			v43 = 0;
			while(2) {
				v7 = &heights[(v44 + v43) / 4];
				v37 = 0;
				v32 = *v7;
				v33 = heights[(v44 + v43 + 68) / 4];
				v8 = &heights[v43 / 4 + v45 / 4];
				v35 = *v8;
				v36 = heights[(v45 + v43 + 68)/4];
				v31 = 2 * v43;
				v38 = 0.125f * ((v7[1] - *v7))(F32);
				v39 = 0.125f * ((v7[18] - v33))(F32);
				v40 = 0.125f * ((v8[1] - *v8))(F32);
				v41 = 0.125f * ((v8[18] - v36))(F32);
				do {
					v9 = v42;
					v10 = v33;
					v11 = 0;
					v12 = v32;
					do {
						v13 = (v46 << 7) | v31 | ((v11 + v34) << 11);
						v14 = ((v10 - v12))(F32) * 0.25f;
						if(v31 > 63) {
							v15 = &a4[v13];
							v16 = v12;
							v17 = 0;
							v18 = v11;
							do {
								v19 = 0;
								if(v16 > 0.0f) v19 = s->ids.rock;
								++v17;
								*v15 = v19;
								v15 += 128;
								v16 = v16 + v14;
							} while(v17 != 4);
LABEL_11:
							v20 = v18;
							goto LABEL_12;
						}
						if(v31 == 63) {
							v25 = &a4[v13];
							v26 = v12;
							v27 = 0;
							v18 = v11;
							do {
								if(v9[v27] >= 0.5f) {
									v29 = s->ids.calmWater;
								} else {
									v29 = s->ids.ice;
								}
								if(v26 > 0.0f) v29 = s->ids.rock;
								++v27;
								*v25 = v29;
								v25 += 128;
								v26 = v26 + v14;
							} while(v27 != 4);
							goto LABEL_11;
						}
						v21 = &a4[v13];
						v22 = v12;
						v23 = 0;
						v30 = v11;
						do {
							v24 = s->ids.calmWater;
							if(v22 > 0.0f) v24 = s->ids.rock;
							++v23;
							*v21 = v24;
							v21 += 128;
							v22 = v22 + v14;
						} while(v23 != 4);
						v20 = v30;
LABEL_12:
						v11 = v20 + 1;
						v9 += 16;
						v12 = v12 + ((((v35 - v32))(F32) * 0.25f))(F32);
						v10 = v10 + ((((v36 - v33))(F32) * 0.25f))(F32);
					} while(v11 != 4);
					++v37;
					++v31;
					v32 = v32 + v38;
					v33 = v33 + v39;
					v35 = v35 + v40;
					v36 = v36 + v41;
				} while(v37 != 8);
				v43 += 4;
				if(v43 != 64) {
					heights = s->heights;
					continue;
				}
				break;
			}
			v46 += 4;
			v42 += 4;
			if(v46 != 16) {
				v45 += 68;
				v44 += 68;
				heights = s->heights;
				continue;
			}
			break;
		}
		v34 += 4;
		a6 += 64;
		if(v34 != 16) {
			heights = s->heights;
			continue;
		}
		break;
	}
}

Bool RandomLevelSource_Init(RandomLevelSource *s,Level *l,BiomeSource *b,MCGenIDs027 *ids,I32 seed){if(!l || !b || !ids)return FALSE;memset(s,0,sizeof(RandomLevelSource));s->level=l;s->biomeSource=b;s->ids=*ids;Random_setSeed(&s->random,seed);PerlinNoise_InitRandom(&s->octave16noise_1,&s->random,16);PerlinNoise_InitRandom(&s->octave16noise_2,&s->random,16);PerlinNoise_InitRandom(&s->octave8noise_1,&s->random,8);PerlinNoise_InitRandom(&s->sandAndGravelNoise,&s->random,4);PerlinNoise_InitRandom(&s->octave4noise_2,&s->random,4);PerlinNoise_InitRandom(&s->octave10noise_1,&s->random,10);PerlinNoise_InitRandom(&s->octave16noise_3,&s->random,16);PerlinNoise_InitRandom(&s->treeNoise,&s->random,8);s->heights=MC_Alloc(1024*sizeof(F32));return TRUE;}
U0 RandomLevelSource_Destroy(RandomLevelSource *s){PerlinNoise_Destroy(&s->octave16noise_1);PerlinNoise_Destroy(&s->octave16noise_2);PerlinNoise_Destroy(&s->octave8noise_1);PerlinNoise_Destroy(&s->sandAndGravelNoise);PerlinNoise_Destroy(&s->octave4noise_2);PerlinNoise_Destroy(&s->octave10noise_1);PerlinNoise_Destroy(&s->octave16noise_3);PerlinNoise_Destroy(&s->treeNoise);free(s->heights);free(s->interpolationNoises);free(s->upperInterpolationNoises);free(s->lowerInterpolationNoises);free(s->biomeNoises);free(s->depthNoises);}
LevelChunk *RandomLevelSource_getChunk(RandomLevelSource *s,I32 x,I32 z){if(x<0 || x>15 || z<0 || z>15)return NULL;LevelChunk *existing=Level_getChunk(s->level,x,z,FALSE);if(existing)return existing;Biome **biomes=BiomeSource_getBiomeBlock(s->biomeSource,x*16,z*16,16,16);if(!biomes)return NULL;I32 i;for(i=0;i<256;i++)if(!biomes[i])return NULL;LevelChunk *c=Level_getChunk(s->level,x,z,TRUE);Random_setSeed(&s->random,(132899541*z+341872712*x)(U32));RandomLevelSource_prepareHeights(s,x,z,c->tiles,NULL,s->biomeSource->rainfall);RandomLevelSource_buildSurfaces(s,x,z,c->tiles,biomes);LevelChunk_recalcHeightmap(c);c->unsaved=TRUE;s->generated[x+16*z]=TRUE;return c;}
Bool RandomLevelSource_postProcess(RandomLevelSource *s,I32 x,I32 z){/* Full ore/tree/snow/mob decoration remains an explicit backend, not fake success. */if(!s->decorate)return FALSE;LevelChunk *c=RandomLevelSource_getChunk(s,x,z);if(!c)return FALSE;if(c->decorated)return TRUE;if(!s->decorate(s->context,s->level,x,z,&s->random))return FALSE;c->decorated=TRUE;return TRUE;}

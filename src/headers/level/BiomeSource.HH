// Batch023: level/BiomeSource; explicit simulation ABI, see docs/BATCH023.md.
class BiomeSource {Random seeds[3];PerlinNoise temperatureNoise,rainNoise,detailNoise;F32 *temperatures,*rainfall,*details;Biome **biomes;I32 capacity;};
U0 BiomeSource_Init(BiomeSource*,I32);U0 BiomeSource_Destroy(BiomeSource*);F32 *BiomeSource_getTemperatureBlock(BiomeSource*,I32,I32,I32,I32);Biome **BiomeSource_getBiomeBlock(BiomeSource*,I32,I32,I32,I32);Biome *BiomeSource_getBiome(BiomeSource*,I32,I32);

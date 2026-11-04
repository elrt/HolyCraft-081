// Batch 002. Source: minecraftpe/impl/math/noise/PerlinNoise.cpp
F32 PerlinNoise_getValue2(PerlinNoise *self,F32 x, F32 y) {

	F32 v4;
	I32 v6;
	F32 v8;
	F32 v10;

	v4 = 0;
	v6 = 0;
	v8 = 1.0;

	while(v6 < self->octavesAmount){
		ImprovedNoise* noise = self->octaves[v6];
		++v6;

		v10 = ImprovedNoise_getValue2(noise,x*v8,y*v8) / v8;
		v8 = v8 * 0.5;
		v4 = v4 + v10;
	}

	return v4;

}
U0 PerlinNoise_init(PerlinNoise *self,I32 count) {

	self->octavesAmount = count;
	I32 cntr = 0;
	self->octaves = MC_Alloc(self->octavesAmount*sizeof(ImprovedNoise*));

	while(cntr < count){
		ImprovedNoise* noise = ImprovedNoise_New(self->randomPtr);
		self->octaves[cntr] = noise;
		++cntr;
	}

}
F32 PerlinNoise_getValue3(PerlinNoise *self,F32 x, F32 y, F32 z) {

	F32 v5;
	I32 index;
	F32 v10;
	F32 v12;

	v5 = 0;
	index = 0;
	v10 = 1.0;

	while(index < self->octavesAmount){
		ImprovedNoise* noise = self->octaves[index];
		++index;
		v12 = ImprovedNoise_getValue3(noise,x*v10,y*v10,z*v10) / v10;
		v10 = v10 * 0.5;
		v5 = v5 + v12;
	}

	return v5;

}
F32* PerlinNoise_getRegion3(PerlinNoise *self,F32* array, F32 a3, F32 a4, F32 a5, I32 a6, I32 a7, I32 a8, F32 a9, F32 a10, F32 a11) {

	I32 totalSize;
	F32* arrayPtr;
	I32 i, octaveIndex;
	F32 v19;
	ImprovedNoise* octave;

	totalSize = a8*a7*a6;
	if(!array) array = MC_Alloc(totalSize*sizeof(F32));
	arrayPtr = array;

	for(i = 0; i < totalSize; ++i){
		arrayPtr[i] = 0;
	}

	octaveIndex = 0;
	v19 = 1;
	while(octaveIndex < self->octavesAmount){
		octave = self->octaves[octaveIndex];
		++octaveIndex;

		ImprovedNoise_add(octave,array, a3, a4, a5, a6, a7, a8, a9*v19, a10*v19, a11*v19, v19);
		v19 = v19 * 0.5;
	}

	return array;

}
F32* PerlinNoise_getRegion2(PerlinNoise *self,F32* a2, I32 a3, I32 a4, I32 a5, I32 a6, F32 a7, F32 a8, F32 a9) {

	return PerlinNoise_getRegion3(self,a2, a3, 10, a4, a5, 1, a6, a7, 1.0, a8);

}
I32 PerlinNoise_hashCode(PerlinNoise *self) {

	I32 index, hashCode;

	index = 0;
	hashCode = 4711;

	while(index < self->octavesAmount){
		ImprovedNoise* n = self->octaves[index];
		++index;
		hashCode *= ImprovedNoise_hashCode(n);
	}

	return hashCode;

}

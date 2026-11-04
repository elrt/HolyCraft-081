// Batch 002. Source: minecraftpe/impl/math/noise/ImprovedNoise.cpp
U0 ImprovedNoise_init(ImprovedNoise *self,Random* a2) {

	F32 xFloat, yFloat, zFloat;
	I32 index;
	I32 rand, swpElement;

	xFloat = Random_nextFloat(a2); 
	yFloat = Random_nextFloat(a2);
	zFloat = Random_nextFloat(a2);

	self->xCoord = xFloat*256;
	self->yCoord = yFloat*256;
	self->zCoord = zFloat*256;

	for(index = 0; index != 256; ++index){
		self->permutations[index] = index;
	}

	for(index = 0; index != 256; ++index){
		rand = Random_genrand_int32(a2) % (256 - index) + index;
		swpElement = self->permutations[index];
		self->permutations[index] = self->permutations[rand];
		self->permutations[rand] = swpElement;
		self->permutations[index + 256] = self->permutations[index];
	}

}
F32 ImprovedNoise_lerp(ImprovedNoise *self,F32 a2, F32 a3, F32 a4) {

	return a3 + ((a4 - a3) * a2);

}
F32 ImprovedNoise_grad2(ImprovedNoise *self,I32 a2, F32 a3, F32 a4) {

	U32 v5;
	F32 v6;

	v5 = a2 & 0xF;
	v6 = (1 - ((a2(U32) >> 3) & 1)) * a3;
	if(v5 <= 3) a3 = 0.0;
	else if(v5 != 12 && v5 != 14) a3 = a4;

	if((a2 & 1) != 0) v6 = -v6;
	if((a2 & 2) != 0) a3 = -a3;
	return v6 + a3;

}
F32 ImprovedNoise_grad(ImprovedNoise *self,I32 a2, F32 a3, F32 a4, F32 a5) {

	U32 v6;
	F32 v7;

	v6 = a2 & 0xF;
	if(v6 > 7){
		v7 = a4;
		if(v6 == 12) goto LABEL_8;
	}else{
		v7 = a3;
		if((a2 & 0xF) <= 3){
			a3 = a4;
			goto LABEL_8;
		}
	}
	if(v6 != 14) a3 = a5;

LABEL_8:
	if((a2 & 1) != 0) v7 = -v7;
	if((a2 & 2) != 0) a3 = -a3;

	return v7 + a3;

}
F32 ImprovedNoise_noise(ImprovedNoise *self,F32 x, F32 y, F32 z) {

	x += self->xCoord;
	y += self->yCoord;
	z += self->zCoord;

	I32 floorX = x;
	I32 floorY = y;
	I32 floorZ = z;

	if(x < floorX) --floorX;
	if(y < floorY) --floorY;
	if(z < floorZ) --floorZ;

	I32 X = floorX & 0xff;
	I32 Y = floorY & 0xff;
	I32 Z = floorZ & 0xff;

	x -= floorX;
	y -= floorY;
	z -= floorZ;

	F32 fX = FADE(x);
	F32 fY = FADE(y);
	F32 fZ = FADE(z);

	I32 A = self->permutations[X] + Y;
	I32 AA = self->permutations[A] + Z;
	I32 AB = self->permutations[A + 1] + Z;

	I32 B = self->permutations[X + 1] + Y;
	I32 BA = self->permutations[B] + Z;
	I32 BB = self->permutations[B + 1] + Z;

	return ImprovedNoise_lerp(self,fZ,
		ImprovedNoise_lerp(self,fY,
			ImprovedNoise_lerp(self,fX, ImprovedNoise_grad(self,self->permutations[AA], x, y, z), ImprovedNoise_grad(self,self->permutations[BA], x-1, y, z)),
			ImprovedNoise_lerp(self,fX, ImprovedNoise_grad(self,self->permutations[AB], x, y-1, z), ImprovedNoise_grad(self,self->permutations[BB], x-1, y-1, z))
		),
		ImprovedNoise_lerp(self,fY,
			ImprovedNoise_lerp(self,fX, ImprovedNoise_grad(self,self->permutations[AA+1], x, y, z-1), ImprovedNoise_grad(self,self->permutations[BA + 1], x-1, y, z-1)),
			ImprovedNoise_lerp(self,fX, ImprovedNoise_grad(self,self->permutations[AB+1], x, y-1, z-1), ImprovedNoise_grad(self,self->permutations[BB + 1], x-1, y-1, z-1))
		)
	);

}
F32 ImprovedNoise_getValue2(ImprovedNoise *self,F32 x, F32 y) {

	return ImprovedNoise_noise(self,x, y, 0);

}
F32 ImprovedNoise_getValue3(ImprovedNoise *self,F32 x, F32 y, F32 z) {

	return ImprovedNoise_noise(self,x, y, z);

}
U0 ImprovedNoise_add(ImprovedNoise *self,F32* noises, F32 x, F32 y, F32 z, I32 width, I32 height, I32 depth, F32 scaleX, F32 scaleY, F32 scaleZ, F32 scale) {


	if(height == 1){
		I32 j3 = 0;
		F32 d12 = 1/scale;
		for(I32 w = 0; w < width; ++w){
			F32 xFull = (x + w) * scaleX + self->xCoord;
			I32 floorXFull = xFull;
			if(xFull < floorXFull) --floorXFull;
			I32 k4 = floorXFull & 0xff;
			xFull -= floorXFull;

			F32 xFullLerp = FADE(xFull);
			for(I32 d = 0; d < depth; ++d){
				F32 zFull = (z + d) * scaleZ + self->zCoord;
				I32 zFloor = zFull;
				if(zFull < zFloor) --zFloor;
				I32 l5 = zFloor & 0xff;
				zFull -= zFloor;
				F32 zFullLerp = FADE(zFull);
				I32 l = self->permutations[k4] + 0;
				I32 j1 = self->permutations[l] + l5;
				I32 k1 = self->permutations[k4 + 1] + 0;
				I32 l1 = self->permutations[k1] + l5;

				F32 d9 = ImprovedNoise_lerp(self,xFullLerp, ImprovedNoise_grad2(self,self->permutations[j1], xFull, zFull), ImprovedNoise_grad(self,self->permutations[l1], xFull - 1, 0, zFull));
				F32 d11 = ImprovedNoise_lerp(self,xFullLerp, ImprovedNoise_grad(self,self->permutations[j1 + 1], xFull, 0, zFull - 1), ImprovedNoise_grad(self,self->permutations[l1 + 1], xFull - 1, 0, zFull - 1));
				F32 d23 = ImprovedNoise_lerp(self,zFullLerp, d9, d11);
				noises[j3] += d23 * d12;
				++j3;
			}
		}
		return;
	}

	I32 i1 = 0;
	F32 d7 = 1 / scale;
	I32 i2 = -1;
	F32 d13 = 0;
	F32 d15 = 0;
	F32 d16 = 0;
	F32 d18 = 0;
	for(I32 i5 = 0; i5 < width; i5++){
		F32 d20 = (x + i5) * scaleX + self->xCoord;
		I32 k5 = d20;
		if(d20 < k5) --k5;
		I32 i6 = k5 & 0xff;
		d20 -= k5;
		F32 d22 = FADE(d20);
		for(I32 j6 = 0; j6 < depth; j6++){
			F32 d24 = (z + j6) * scaleZ + self->zCoord;
			I32 k6 = d24;
			if(d24 < k6) --k6;
			I32 l6 = k6 & 0xff;
			d24 -= k6;
			F32 d25 = FADE(d24);
			for(I32 i7 = 0; i7 < height; i7++){
				F32 d26 = (y + i7) * scaleY + self->yCoord;
				I32 j7 = d26;
				if(d26 < j7) --j7;
				I32 k7 = j7 & 0xff;
				d26 -= j7;
				F32 d27 = FADE(d26);
				if(i7 == 0 || k7 != i2){
					i2 = k7;
					I32 j2 = self->permutations[i6] + k7;
					I32 k2 = self->permutations[j2] + l6;
					I32 l2 = self->permutations[j2 + 1] + l6;
					I32 i3 = self->permutations[i6 + 1] + k7;
					I32 k3 = self->permutations[i3] + l6;
					I32 l3 = self->permutations[i3 + 1] + l6;
					d13 = ImprovedNoise_lerp(self,d22, ImprovedNoise_grad(self,self->permutations[k2], d20, d26, d24), ImprovedNoise_grad(self,self->permutations[k3], d20 - 1, d26, d24));
					d15 = ImprovedNoise_lerp(self,d22, ImprovedNoise_grad(self,self->permutations[l2], d20, d26 - 1, d24), ImprovedNoise_grad(self,self->permutations[l3], d20 - 1, d26 - 1, d24));
					d16 = ImprovedNoise_lerp(self,d22, ImprovedNoise_grad(self,self->permutations[k2 + 1], d20, d26, d24 - 1), ImprovedNoise_grad(self,self->permutations[k3 + 1], d20 - 1, d26, d24 - 1));
					d18 = ImprovedNoise_lerp(self,d22, ImprovedNoise_grad(self,self->permutations[l2 + 1], d20, d26 - 1, d24 - 1), ImprovedNoise_grad(self,self->permutations[l3 + 1], d20 - 1, d26 - 1, d24 - 1));
				}
				F32 d28 = ImprovedNoise_lerp(self,d27, d13, d15);
				F32 d29 = ImprovedNoise_lerp(self,d27, d16, d18);
				F32 d30 = ImprovedNoise_lerp(self,d25, d28, d29);
				noises[i1] += d30 * d7;
				++i1;
			}
		}
	}

}
I32 ImprovedNoise_hashCode(ImprovedNoise *self) {

	I32 v1 = 0;
	I32 v2 = 4711;
	do{
		v2 = self->permutations[v1] + 37 * v2;
	}while(++v1 != 512);
	return v2;

}
